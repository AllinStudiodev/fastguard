//import 'package:fastguard/todos/todos.dart';
//import 'package:fastguard/todos/todos_repository/todos_repository.dart';
import 'package:flutter/material.dart';
import 'package:division/division.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:fastguard/authentication_bloc/bloc.dart';
//import 'package:fastguard/todos/todos.dart';

class Feature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FeatureItem(Icons.atm, (Colors.indigo), 'Todos'),
      ],
    );
  }
}

class FeatureItem extends StatefulWidget {
  FeatureItem(this.icon, this.iconBgColor, this.title);

  final IconData icon;
  final Color iconBgColor;
  final String title;

  @override
  _FeatureItemState createState() => _FeatureItemState();
}

class _FeatureItemState extends State<FeatureItem> {
  //bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: featureItemStyle,
      // gesture: Gestures()..onTap(() =>
      // BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut())),
      gesture: Gestures()
        ..onTap(() => Navigator.pushNamed(context, '/todo')),
      child: Column(
        children: <Widget>[
          Parent(
            style: featureItemIconStyle(widget.iconBgColor),
            child: Icon(widget.icon, color: Colors.white, size: 50),
          ),
          Txt(widget.title, style: itemTitleTextStyle)
        ],
      ),
    );
  }

  ///stylenya cuk
  final featureItemStyle = ParentStyle()
    ..elevation(50, color: Colors.amber)
    ..scale(1.0)
    ..alignmentContent.center()
    ..height(120)
    ..width(100)
    ..borderRadius(all: 10)
    ..background.color(Colors.white)
    ..ripple(true)
    ..animate(150, Curves.easeOut);

  final featureItemIconStyle = (Color color) => ParentStyle()
    ..background.color(color)
    ..margin(all: 10)
    ..padding(all: 10)
    ..borderRadius(all: 30);

  final TxtStyle itemTitleTextStyle = TxtStyle()
    //..bold()
    ..fontSize(20);
}
