import 'package:meta/meta.dart';
import 'incident_entity.dart';
import 'package:equatable/equatable.dart';

@immutable
class Incident extends Equatable {
  final String id;
  final String foto;
  final String incident;
  final String lokasi;
  final DateTime timestamp;
  final String username;
  final String tipeIncident;

  Incident(this.id, this.foto, this.incident, this.lokasi, this.timestamp,
      this.username, this.tipeIncident);

  @override
  List<Object> get props =>
      [id, foto, incident, lokasi, timestamp, username, tipeIncident];

  Incident copyWith(
      {String id,
      String foto,
      String incident,
      String lokasi,
      DateTime timestamp,
      String username,
      List tipeIncident}) {
    return Incident(
      id ?? this.id,
      foto ?? this.foto,
      incident ?? this.incident,
      lokasi ?? this.lokasi,
      timestamp ?? this.timestamp,
      username ?? this.username,
      tipeIncident ?? this.tipeIncident,
    );
  }

  @override
  String toString() {
    return 'Incident { id: $id, foto: $foto, incident: $incident, lokasi: $lokasi, timestamp: $timestamp, username: $username, tipeIncident: $tipeIncident }';
  }

  IncidentEntity toEntity() {
    return IncidentEntity(
        id, foto, incident, lokasi, timestamp, username, tipeIncident);
  }

  static Incident fromEntity(IncidentEntity entity) {
    return Incident(entity.id, entity.foto, entity.incident, entity.lokasi,
        entity.timestamp, entity.username, entity.tipeIncident);
  }
}
