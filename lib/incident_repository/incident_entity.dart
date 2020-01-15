import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class IncidentEntity extends Equatable {
  final String id;
  final String foto;
  final String incident;
  final String lokasi;
  final DateTime timestamp;
  final String username;
  final String tipeIncident;

  const IncidentEntity(this.id, this.foto, this.incident, this.lokasi,
      this.timestamp, this.username, this.tipeIncident);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "foto": foto,
      "incident": incident,
      "lokasi": lokasi,
      "timestamp": timestamp,
      "username": username,
      "tipeIncident": tipeIncident
    };
  }

  @override
  List<Object> get props =>
      [id, foto, incident, lokasi, timestamp, username, tipeIncident];

  @override
  String toString() {
    return 'TodoEntity { id: $id, foto: $foto, incident: $incident, lokasi: $lokasi, timestamp: $timestamp, username: $username, tipeIncident: $tipeIncident }';
  }

  static IncidentEntity fromJson(Map<String, Object> json) {
    return IncidentEntity(
      json["id"] as String,
      json["foto"] as String,
      json["incident"] as String,
      json["lokasi"] as String,
      json["timestamp"] as DateTime,
      json["username"] as String,
      json["tipeIncident"] as String,
    );
  }

  static IncidentEntity fromSnapshot(DocumentSnapshot snap) {
    return IncidentEntity(
      snap.documentID,
      snap.data['foto'],
      snap.data['incident'],
      snap.data['lokasi'],
      snap.data['timestamp'],
      snap.data['username'],
      snap.data['tipeIncident'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "foto": foto,
      "incident": incident,
      "lokasi": lokasi,
      "timestamp": timestamp,
      "username": username,
      "tipeIncident": tipeIncident,
    };
  }
}
