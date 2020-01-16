import 'package:equatable/equatable.dart';
import 'package:fastguard/repository/incident_repository/incident_model.dart';

abstract class IncidentEvent extends Equatable {
  const IncidentEvent();

  @override
  List<Object> get props => [];
}

class LoadIncident extends IncidentEvent {}

class AddIncident extends IncidentEvent {
  //ambil dari Incident Model di repository
  final Incident incident;

  const AddIncident(this.incident);

  @override
  List<Object> get props => [incident];

  //catet di bloc delegate, evennya
  @override
  String toString() => 'AddIncident{incident: $incident}';
}

//meload incident ketika ada tambah data
class IncidentUpdated extends IncidentEvent {
  final List<Incident> incident;

  const IncidentUpdated(this.incident);

  @override
  List<Object> get props => [incident];
}
