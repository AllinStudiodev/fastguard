import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Incident"),
            onPressed: () {
              Navigator.pushNamed(context, '/incident');
            },
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text("todo"),
            onPressed: () {
              Navigator.pushNamed(context, '/todo');
            },
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text("image Picker"),
            onPressed: () {
              Navigator.pushNamed(context, '/image');
            },
          )
        ],
      ),
    );
  }
}
