import 'package:fastguard/incident/bloc/bloc.dart';
import 'package:fastguard/incident/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncidentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<IncidentBloc, IncidentState>(
      builder: (context, state) {
        if (state is IncidentLoading)
          return Text("loading");
        else if (state is IncidentLoaded) {
          final incidents = state.incident;
          return ListView.builder(
            itemCount: incidents.length,
            itemBuilder: (context, index) {
              final incident = incidents[index];
              return IncidentItem(
                incident: incident,
                onDismissed: (direction) {},
                onTap: () async {},
                onCheckboxChanged: (_) {},
              );
            },
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
