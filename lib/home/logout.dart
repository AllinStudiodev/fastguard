import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastguard/authentication_bloc/bloc.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        LogoutItem(Icons.location_on, (Colors.indigo), 'Plotting'),
      ],
    );
  }
}

class LogoutItem extends StatefulWidget {
  LogoutItem(this.icon, this.iconBgColor, this.title);

  final IconData icon;
  final Color iconBgColor;
  final String title;

  @override
  _LogoutItemState createState() => _LogoutItemState();
}

class _LogoutItemState extends State<LogoutItem> {
  //bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: logoutItemStyle,
      gesture: Gestures()
        ..onTap(() =>
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut())),
      child: Column(
        children: <Widget>[
          Parent(
            style: logoutItemIconStyle(widget.iconBgColor),
            child: Icon(widget.icon, color: Colors.white, size: 50),
          ),
          Txt(widget.title, style: itemTitleTextStyle)
        ],
      ),
    );
  }

  ///stylenya cuk
  final logoutItemStyle = ParentStyle()
    ..elevation(50, color: Colors.amber)
    ..scale(1.0)
    ..alignmentContent.center()
    ..height(120)
    ..width(100)
    ..borderRadius(all: 10)
    ..background.color(Colors.white)
    ..ripple(true)
    ..animate(150, Curves.easeOut);

  final logoutItemIconStyle = (Color color) => ParentStyle()
    ..background.color(color)
    ..margin(all: 10)
    ..padding(all: 10)
    ..borderRadius(all: 30);

  final TxtStyle itemTitleTextStyle = TxtStyle()
    //..bold()
    ..fontSize(20);
}
