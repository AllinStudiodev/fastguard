import 'package:fastguard/authentication_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionsRow extends StatelessWidget {
  Widget _buildActionsItem(IconData icon, String title) {
    return Parent(
      style: actionsItemStyle,
      child: Column(
        children: <Widget>[
          Parent(
            style: actionsItemIconStyle,
            child: Icon(icon, size: 50, color: Colors.indigo),
          ),
          Txt(title, style: actionsItemTextStyle)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildActionsItem(Icons.tap_and_play, 'Plotting'),
            _buildActionsItem(Icons.tap_and_play, 'Patroli'),
            _buildActionsItem(Icons.tap_and_play, 'Message')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildActionsItem(Icons.tap_and_play, 'Plotting'),
            _buildActionsItem(Icons.tap_and_play, 'Patroli'),
            _buildActionsItem(Icons.tap_and_play, 'Message')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildActionsItem(Icons.tap_and_play, 'Plotting'),
            _buildActionsItem(Icons.assessment, 'Patroli'),
            GestureDetector(
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
              child: _buildActionsItem(Icons.exit_to_app, 'Logout'),
            )
          ],
        ),
      ],
    );
  }

  final ParentStyle actionsItemIconStyle = ParentStyle()
    ..alignmentContent.center()
    ..width(50)
    ..height(50)
    ..margin(bottom: 5)
    ..borderRadius(all: 10)
    ..background.hex('#F6F5F8')
    ..ripple(true)
    ..elevation(10, color: hex('#3977FF'));

  final ParentStyle actionsItemStyle = ParentStyle()..margin(vertical: 30.0);

  final TxtStyle actionsItemTextStyle = TxtStyle()
    ..textColor(Colors.black.withOpacity(0.8))
    ..fontSize(20);
}
