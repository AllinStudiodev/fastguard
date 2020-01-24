import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fastguard/home/bloc/bloc.dart';
import 'package:fastguard/home/pages/account_page.dart';
import 'package:fastguard/home/pages/activity_page.dart';
import 'package:fastguard/home/models/models.dart';
import 'package:fastguard/home/widgets/widgets.dart';
import 'package:fastguard/core/authentication_bloc/bloc.dart';

class HomePage extends StatelessWidget {
  final String name;
  HomePage({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
      return Scaffold(
        appBar: AppBar(
          title: Text('$name'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
              },
            )
          ],
        ),
        body: activeTab == AppTab.activity ? ActivityPage() : AccountPage(),
        bottomNavigationBar: TabSelector(
          activeTab: activeTab,
          onTabSelected: (tab) =>
              BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
        ),
      );
    });
  }
}
