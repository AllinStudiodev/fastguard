import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fastguard/repository/incident_repository/incident_repository.dart';
//import 'package:intl/intl.dart';

class IncidentItem extends StatelessWidget {
  final GestureTapCallback onTap;
  final Incident incident;

  IncidentItem({
    Key key,
    @required this.onTap,
    @required this.incident,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


//final f = new DateFormat('yyyy-MM-dd hh:mm');

//Text(f.format(new DateTime.fromMillisecondsSinceEpoch(values[index]["start_time"]*1000)));

//final df = new DateFormat('dd-MM-yyyy hh:mm a');
//print(df.format(new DateTime.fromMillisecondsSinceEpoch(incident.timestamp*1000)));
//var _timestamp = _date.toString();

    return ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${incident.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              incident.incident,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        subtitle: Text(
          incident.timestamp,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subhead,
        ));
  }
}
