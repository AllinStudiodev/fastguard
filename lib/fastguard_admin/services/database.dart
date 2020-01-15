import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference securityCollection =
      Firestore.instance.collection('security');

  Future updateUserData(
      String alamat,
      String corporateId,
      String displayName,
      String kemampuan,
      String keterangan,
      String password,
      String photoURL,
      String playerId,
      String telepon,
      String username) async {
    return await securityCollection.document(uid).setData({
      'alamat': alamat,
      'corporate_id': corporateId,
      'displayName': displayName,
      'kemampuan': kemampuan,
      'keterangan': keterangan,
      'password': password,
      'photoURL': photoURL,
      'player_id': playerId,
      'telepon': telepon,
      'username': username
    });
  }
}
