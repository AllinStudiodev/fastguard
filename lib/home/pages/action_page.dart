import 'package:fastguard/incident/bloc/bloc.dart';
import 'package:fastguard/incident/widgets/widgets.dart';
import 'package:fastguard/repository/incident_repository/incident_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            IncidentBloc(incidentRepository: IncidentRepository())
              ..add(LoadIncident()),
        child: TesCuk(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/todo');
        },
        label: Text("Tambah Incident"),
        icon: Icon(Icons.add),
        tooltip: 'Tambah Incident',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TesCuk extends StatefulWidget {
  @override
  _TesCukState createState() => _TesCukState();
}

class _TesCukState extends State<TesCuk> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncidentBloc, IncidentState>(builder: (context, state) {
      if (state is IncidentLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is IncidentNotLoaded) {
        return Center(
          child: Text("no data cuk"),
        );
      }
      if (state is IncidentLoaded) {
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
            });
      } else {
        return Container();
      }
    });
  }
}
