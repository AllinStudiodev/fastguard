import 'package:fastguard/fastguard_admin/models/user.dart';
import 'package:fastguard/fastguard_admin/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create obj based on firebase
  User _userFromFIrebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFIrebaseUser);
  }

  //sign in anom
  Future signInAnom() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFIrebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFIrebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register email pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

//bikin user di document sesuai uid
      await DatabaseService(uid: user.uid).updateUserData(
          'kosong',
          'Unit Testing',
          'displayName',
          'kemampuan',
          'keterangan',
          'admin123',
          'photoURL',
          'player_id',
          'telepon',
          'username');

      return _userFromFIrebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
