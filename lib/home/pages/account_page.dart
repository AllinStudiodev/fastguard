import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _timestamp = new DateTime.now();
    var date = new DateFormat("dd-MM-yyyy").add_jm().format(_timestamp);


    
    return Center(
      child: Text(date.toString()),
    );
  }
}
