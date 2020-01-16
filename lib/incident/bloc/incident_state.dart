import 'package:equatable/equatable.dart';
import 'package:fastguard/repository/incident_repository/incident_repository.dart';

abstract class IncidentState extends Equatable {
  const IncidentState();

  @override
  List<Object> get props => [];
}

class IncidentLoading extends IncidentState {}

class IncidentLoaded extends IncidentState {
  final List<Incident> incident;

  const IncidentLoaded([this.incident = const []]);

  @override
  List<Object> get props => [incident];

  @override
  String toString() => 'IncidentLoaded { incident: $incident }';
}

class IncidentNotLoaded extends IncidentState {}
