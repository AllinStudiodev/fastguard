import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class IncidentDetail extends StatelessWidget {
  final String id;
  final String foto;
  final String incident;
  final String lokasi;
  final String timestamp;
  final String username;
  final String tipeIncident;

  const IncidentDetail(
      {Key key,
      this.id,
      this.foto,
      this.incident,
      this.lokasi,
      this.timestamp,
      this.username,
      this.tipeIncident})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

//var one = int.parse(timestamp);
//var formatedDate = new DateFormat('yyy-MM-dd').format(one);

    return Scaffold(
        appBar: AppBar(
          title: Text(id),
        ),
        body: Scrollbar(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Tipe Insident : ",
                      style: textTheme.headline,
                    ),
                    Text(tipeIncident, style: textTheme.subhead)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Detail Kejadian : ", style: textTheme.headline),
                    Text(
                      incident,
                      style: textTheme.subhead,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text("Lokasi Kejadian : ", style: textTheme.headline),
                    Flexible(
                      child: Text(
                        lokasi,
                        style: textTheme.subhead,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text("Waktu Kejadian : ", style: textTheme.headline),
                    Flexible(
                      child: Text(
                        timestamp,
                        style: textTheme.subhead,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text("Username input : ", style: textTheme.headline),
                    Text(
                      username,
                      style: textTheme.subhead,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    (foto != null)
                        ? Image.network(foto)
                        : Text("tidak ada foto")
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
