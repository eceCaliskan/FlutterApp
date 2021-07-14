
import 'package:firebase_auth/firebase_auth.dart';


class UserRepository {
  final FirebaseAuth _firebaseAuth; //defining the firebase

  DateTime _now = new DateTime.now();

  //getting the instance from the firebase authentication
  UserRepository({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  //signs user into the account
  Future <String> signInWithEmail(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return "Success";
  }

}
