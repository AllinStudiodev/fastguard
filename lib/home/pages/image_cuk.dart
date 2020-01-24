import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ImageCuk extends StatefulWidget {
  @override
  _ImageCukState createState() => _ImageCukState();
}

class _ImageCukState extends State<ImageCuk> {
  File _image;
  String hasil = '';

  Future getImage() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 800, maxWidth: 800);

    setState(() {
      _image = image;
      print('image Path $_image');
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child("incident")
        .child("usernya")
        .child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);

    var taskSnapshot = await (await uploadTask.onComplete).ref.getDownloadURL();
    print(taskSnapshot);

    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image Picker Example'),
        ),
        body: Builder(
          builder: (context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 100,
                    child: ClipOval(
                      child: SizedBox(
                          width: 180,
                          height: 180,
                          child: _image == null
                              ? Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/fastguard-4d423.appspot.com/o/profile-default.png?alt=media&token=e1a47e97-8c03-4374-974a-ca6eff23c63d",
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  _image,
                                  fit: BoxFit.fill,
                                )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: IconButton(
                    icon: Icon(Icons.camera),
                    onPressed: () {
                      getImage();
                    },
                  ),
                ),
                RaisedButton(
                    onPressed: () {
                      uploadPic(context);
                    },
                    child: Text("submit")),
              ],
            ),
          ),
        ));
  }
}
