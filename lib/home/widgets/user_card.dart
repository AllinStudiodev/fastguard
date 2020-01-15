import 'package:flutter/material.dart';
import 'package:division/division.dart';

class UserCard extends StatelessWidget {
  final String name;
  UserCard({Key key, @required this.name}) : super(key: key);
  Widget _buildUserRow() {
    return Row(
      children: <Widget>[
        Parent(style: userImageStyle, child: Icon(Icons.account_circle)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Txt('Fast Guard', style: nameTextStyle),
            SizedBox(height: 5),
            Txt('$name', style: nameDescriptionTextStyle)
          ],
        )
      ],
    );
  }

  Widget _buildUserStats() {
    return Parent(
      style: userStatsStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildUserStatsItem('12', 'Patroli'),
          _buildUserStatsItem('51', 'Check'),
          _buildUserStatsItem('267', 'Visitor'),
        ],
      ),
    );
  }

  Widget _buildUserStatsItem(String value, String text) {
    final TxtStyle textStyle = TxtStyle()
      ..fontSize(20)
      ..textColor(Colors.white);
    return Column(
      children: <Widget>[
        Txt(value, style: textStyle),
        SizedBox(height: 5),
        Txt(text, style: nameDescriptionTextStyle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: userCardStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[_buildUserRow(), _buildUserStats()],
      ),
    );
  }

  //Styling

  final ParentStyle userCardStyle = ParentStyle()
    ..height(175)
    ..padding(horizontal: 20.0, vertical: 10)
    ..alignment.center()
    ..background.color(Colors.indigo)
    ..borderRadius(all: 20.0)
    ..elevation(10, color: Colors.indigo);

  final ParentStyle userImageStyle = ParentStyle()
    ..height(50)
    ..width(50)
    ..margin(right: 10.0)
    ..borderRadius(all: 30)
    ..background.hex('ffffff');

  final ParentStyle userStatsStyle = ParentStyle()..margin(vertical: 10.0);

  final TxtStyle nameTextStyle = TxtStyle()
    ..textColor(Colors.white)
    ..fontSize(18)
    ..fontWeight(FontWeight.w600);

  final TxtStyle nameDescriptionTextStyle = TxtStyle()
    ..textColor(Colors.white.withOpacity(0.6))
    ..fontSize(12);
}
