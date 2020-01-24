import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fastguard/incident/bloc/bloc.dart';
import 'package:fastguard/repository/incident_repository/incident_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';
import 'dart:io';
import 'package:path/path.dart';

typedef OnSaveCallback = Function(String foto, String incident, String lokasi,
    String timestamp, String tipeIncident, String username);

class IncidentAdd extends StatefulWidget {
  final OnSaveCallback onSave;
  final Incident incident;

  IncidentAdd({Key key, @required this.onSave, this.incident})
      : super(key: key);

  @override
  _IncidentAddState createState() => _IncidentAddState();
}

class _IncidentAddState extends State<IncidentAdd> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String _incident;
  String _lokasi;
  String _tipeIncident = 'Pencurian';
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 800, maxWidth: 800);

    setState(() {
      _image = image;
      print('image Path $_image');
    });
  }

  Future uploadPic() async {
    String fileName = basename(_image.path);

    var date = new DateTime.now();
    var dateFormat = new DateFormat("dd-MM-yyyy").format(date);
    StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child("incident")
        .child(dateFormat)
        .child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);

    var taskSnapshot = await (await uploadTask.onComplete).ref.getDownloadURL();
    print(taskSnapshot);
    return (taskSnapshot);
  }

  @override
  Widget build(BuildContext context) {
    //tema textFormField
    final textTheme = Theme.of(context).textTheme;

    //waktu sekarang
    var _timestamp = new DateTime.now().toString();
    //var _date = new DateFormat("dd-MM-yyyy").add_jm().format(_timestamp);

    //username input
    String _username = 'eco';

    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Incident"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Tipe Incident :   "),
                  DropdownButton<String>(
                    icon: Icon(Icons.arrow_downward),
                    value: _tipeIncident,
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _tipeIncident = value;
                      });
                    },
                    items: <String>[
                      'Pencurian',
                      'Pembunuhan',
                      'Asusila',
                      'Kerusuhan'
                    ].map<DropdownMenuItem<String>>((String initialValue) {
                      return DropdownMenuItem<String>(
                        value: initialValue,
                        child: Text(initialValue),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  _image == null ? Container() : Image.file(_image),
                  IconButton(
                    icon: Icon(
                      Icons.photo_camera,
                      size: 30.0,
                    ),
                    onPressed: () {
                      getImage();
                    },
                  ),
                  Text("Ambil Foto insiden"),
                ],
              ),
              TextFormField(
                initialValue: '',
                maxLines: 5,
                style: textTheme.subtitle,
                decoration: InputDecoration(hintText: ' Detail incident'),
                validator: (val) {
                  return val.trim().isEmpty ? 'Isi cuk' : null;
                },
                onSaved: (value) => _incident = value,
              ),
              TextFormField(
                initialValue: '',
                style: textTheme.headline,
                decoration: InputDecoration(hintText: 'lokasinya'),
                validator: (val) {
                  return val.trim().isEmpty ? 'Isi cuk' : null;
                },
                onSaved: (value) => _lokasi = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Incident',
        child: Icon(Icons.add),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            //upload ke firebase storage
            uploadPic();

            //ambil foto url
            var _foto = await uploadPic();
            var _fotoURL = _foto.toString();

            //upload ke firestore
            _formKey.currentState.save();
            widget.onSave(_fotoURL, _incident, _lokasi, _timestamp,
                _tipeIncident, _username);
            BlocProvider.of<IncidentBloc>(context).add(
              AddIncident(Incident('uid', _fotoURL, _incident, _lokasi,
                  _timestamp, _tipeIncident, _username)),
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
