import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'incident_repository.dart';

class IncidentRepository {
  final incidentCollection = Firestore.instance.collection('incidents');

  Future<void> addNewIncident(Incident incident) {
    return incidentCollection.add(incident.toEntity().toDocument());
  }

  Stream<List<Incident>> incidents() {
    return incidentCollection.orderBy("timestamp", descending: true).limit(50).snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Incident.fromEntity(IncidentEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
