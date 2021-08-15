import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final _firestoreInstance = FirebaseFirestore.instance; //defining the instance

  UserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
}

class UserDatabase {
  var _firebaseAuth = UserRepository()._firebaseAuth;

  var firestoreInstance = UserRepository()._firestoreInstance;

  UserDatabase({firebaseAuth, firestoreInstance});

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> addtoDatabase(String username) {
    var userUid = _firebaseAuth.currentUser!.uid;
    return firestoreInstance
        .collection('Users')
        .doc(userUid)
        .set({"username ": username});
  }

  Future<void> addPosttoDatabase(String post) {
    var userUid = _firebaseAuth.currentUser!.uid;
    var username = returnUsername();

    return firestoreInstance
        .collection('post')
        .doc(userUid)
        .set({"post ": post});
  }

  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  Future<void> returnUsername() async {
    var userUid = _firebaseAuth.currentUser!.uid;

    DocumentSnapshot snapshot =
        await firestoreInstance.collection('users').doc(userUid).get();
    return snapshot.get(
        'username'); //you can get any field value you want by writing the exact fieldName in the data[fieldName]
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String?> getUser() async {
    return (await _firebaseAuth.currentUser)!.email;
  }
}
