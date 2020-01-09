import 'package:flutter/material.dart';
import 'package:division/division.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:fastguard/authentication_bloc/bloc.dart';
import 'package:fastguard/home/home.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  HomeScreen({Key key, @required this.name}) : super(key: key);

  ///style untuk konten
  final contentStyle = (BuildContext context) => ParentStyle()
    ..overflow.scrollable()
    ..padding(vertical: 20, horizontal: 10)
    ..minHeight(MediaQuery.of(context).size.height - (2 * 30));

  ///style untuk text
  final titleStyle = TxtStyle()
    ..bold()
    ..fontSize(32)
    ..margin(bottom: 20)
    ..alignmentContent.centerLeft();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Parent(
      style: contentStyle(context),
      child: Column(
        children: <Widget>[
          UserCard(name: '$name'),
          SizedBox(height: 20),
          Row(
            children: <Widget>[Feature(), Feature(), Feature()],
          ),
          Row(
            children: <Widget>[Feature(), Feature(), Feature()],
          ),
          Row(
            children: <Widget>[Logout(), Logout(), Logout()],
          )

          //ActionsRow(),
          //Settings(),
        ],
      ),
    )));
  }
}
