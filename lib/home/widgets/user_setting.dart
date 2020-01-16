import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fastguard/core/authentication_bloc/bloc.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SettingsItem(Icons.location_on, hex('#8D7AEE'), 'Address',
            'Ensure your harvesting address'),
        SettingsItem(
            Icons.lock, hex('#F468B7'), 'Privacy', 'System permission change'),
        SettingsItem(
            Icons.menu, hex('#FEC85C'), 'General', 'Basic functional settings'),
        SettingsItem(Icons.notifications, hex('#5FD0D3'), 'Notifications',
            'Take over the news in time'),
        SettingsItem(Icons.question_answer, hex('#BFACAA'), 'Support',
            'We are here to help'),
      ],
    );
  }
}

class SettingsItem extends StatefulWidget {
  SettingsItem(this.icon, this.iconBgColor, this.title, this.description);

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String description;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: settingsItemStyle(pressed),
      gesture: Gestures()
        //..isTap((isTapped) => setState(() =>
        //BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut())))
        //BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        ..onTap(() =>
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut())),
      child: Row(
        children: <Widget>[
          Parent(
            style: settingsItemIconStyle(widget.iconBgColor),
            child: Icon(widget.icon, color: Colors.white, size: 20),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Txt(widget.title, style: itemTitleTextStyle),
              SizedBox(height: 5),
              Txt(widget.description, style: itemDescriptionTextStyle),
            ],
          )
        ],
      ),
    );
  }

  final settingsItemStyle = (pressed) => ParentStyle()
    ..elevation(pressed ? 0 : 50, color: Colors.grey)
    ..scale(pressed ? 0.95 : 1.0)
    ..alignmentContent.center()
    ..height(70)
    ..margin(vertical: 10)
    ..borderRadius(all: 15)
    ..background.hex('#ffffff')
    ..ripple(true)
    ..animate(150, Curves.easeOut);

  final settingsItemIconStyle = (Color color) => ParentStyle()
    ..background.color(color)
    ..margin(left: 15)
    ..padding(all: 12)
    ..borderRadius(all: 30);

  final TxtStyle itemTitleTextStyle = TxtStyle()
    ..bold()
    ..fontSize(16);

  final TxtStyle itemDescriptionTextStyle = TxtStyle()
    ..textColor(Colors.black26)
    ..bold()
    ..fontSize(12);
}
