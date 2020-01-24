import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class IncidentEntity extends Equatable {
  final String id;
  final String foto;
  final String incident;
  final String lokasi;
  final String timestamp;
  final String tipeIncident;
  final String username;

  const IncidentEntity(this.id, this.foto, this.incident, this.lokasi,
      this.timestamp, this.tipeIncident, this.username);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "foto": foto,
      "incident": incident,
      "lokasi": lokasi,
      "timestamp": timestamp,
      "tipe_incident": tipeIncident,
      "username": username,
    };
  }

  @override
  List<Object> get props =>
      [id, foto, incident, lokasi, timestamp, tipeIncident, username];

  @override
  String toString() {
    return 'TodoEntity { id: $id, foto: $foto, incident: $incident, lokasi: $lokasi, timestamp: $timestamp,  tipeIncident: $tipeIncident, username: $username }';
  }

  static IncidentEntity fromJson(Map<String, Object> json) {
    return IncidentEntity(
      json["id"] as String,
      json["foto"] as String,
      json["incident"] as String,
      json["lokasi"] as String,
      json["timestamp"] as String,
      json["tipe_incident"] as String,
      json["username"] as String,
    );
  }

  static IncidentEntity fromSnapshot(DocumentSnapshot snap) {
    return IncidentEntity(
      snap.documentID,
      snap.data['foto'],
      snap.data['incident'],
      snap.data['lokasi'],
      snap.data['timestamp'],
      snap.data['tipe_incident'],
      snap.data['username'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "foto": foto,
      "incident": incident,
      "lokasi": lokasi,
      "timestamp": timestamp,
      "tipe_incident": tipeIncident,
      "username": username,
    };
  }
}