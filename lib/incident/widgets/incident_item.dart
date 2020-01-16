import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fastguard/repository/incident_repository/incident_repository.dart';

class IncidentItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Incident incident;

  IncidentItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.incident,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__incident_item_${incident.id}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        // leading: Checkbox(
        //   value: incident.lokasi,
        //   onChanged: onCheckboxChanged,
        // ),
        title: Hero(
          tag: '${incident.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              incident.tipeIncident,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        subtitle: incident.foto.isNotEmpty
            ? Text(
                incident.incident,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subhead,
              )
            : null,
      ),
    );
  }
}
