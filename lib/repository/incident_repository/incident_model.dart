import 'package:meta/meta.dart';
import 'incident_entity.dart';
import 'package:equatable/equatable.dart';

@immutable
class Incident extends Equatable {
  final String id;
  final String foto;
  final String incident;
  final String lokasi;
  final String timestamp;
  final String tipeIncident;
  final String username;

  Incident(
    this.id,
    this.foto,
    this.incident,
    this.lokasi,
    this.timestamp,
    this.tipeIncident,
    this.username,
  );

  @override
  List<Object> get props =>
      [id, foto, incident, lokasi, timestamp, tipeIncident, username];

  @override
  String toString() {
    return 'Incident { id: $id, foto: $foto, incident: $incident, lokasi: $lokasi, timestamp: $timestamp, tipeIncident: $tipeIncident, username: $username }';
  }

  IncidentEntity toEntity() {
    return IncidentEntity(
        id, foto, incident, lokasi, timestamp, tipeIncident, username);
  }

  static Incident fromEntity(IncidentEntity entity) {
    return Incident(entity.id, entity.foto, entity.incident, entity.lokasi,
        entity.timestamp, entity.tipeIncident, entity.username);
  }
}
