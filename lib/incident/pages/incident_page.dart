import 'package:fastguard/core/authentication_bloc/bloc.dart';
import 'package:fastguard/incident/bloc/bloc.dart';
import 'package:fastguard/incident/pages/pages.dart';
import 'package:fastguard/incident/widgets/widgets.dart';
import 'package:fastguard/repository/incident_repository/incident_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncidentPage extends StatelessWidget {
  final String data;
  IncidentPage(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IncidentAdd(
                        onSave: (String foto,
                            String incident,
                            String lokasi,
                            String timestamp,
                            String tipeIncident,
                            String username) {},
                      )));
        },
        label: Text("Tambah Incident"),
        icon: Icon(Icons.add),
        tooltip: 'Tambah Incident',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('$data'),
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
      body: BlocProvider(
        create: (context) =>
            IncidentBloc(incidentRepository: IncidentRepository())
              ..add(LoadIncident()),
        child: Incidents(),
      ),
    );
  }
}

class Incidents extends StatefulWidget {
  @override
  _IncidentsState createState() => _IncidentsState();
}

class _IncidentsState extends State<Incidents> {
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
                onTap: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return IncidentDetail(
                        id: incident.id,
                        foto: incident.foto,
                        incident: incident.incident,
                        lokasi: incident.lokasi,
                        timestamp: incident.timestamp,
                        username: incident.username,
                        tipeIncident: incident.tipeIncident,
                      );
                    }),
                  );
                },
              );
            });
      } else {
        return Container();
      }
    });
  }
}
