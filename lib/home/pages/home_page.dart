//import 'package:fastguard/home/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:division/division.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:fastguard/authentication_bloc/bloc.dart';
import 'package:fastguard/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final String name;
  HomePage({Key key, @required this.name}) : super(key: key);

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
            children: <Widget>[Logout(), Logout(), Logout()],
          )

          //ActionsRow(),
          //Settings(),
        ],
      ),
    )));
  }
}

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