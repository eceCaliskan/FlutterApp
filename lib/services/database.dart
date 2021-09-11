import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

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
        .set({'username ': username});
  }

  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  Future<String> returnUsername() async {
    var userUid = _firebaseAuth.currentUser!.uid;

    DocumentSnapshot snapshot =
        await firestoreInstance.collection('Users').doc(userUid).get();

    String username = snapshot.get('username ');

    return username; //you can get any field value you want by writing the exact fieldName in the data[fieldName]
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String?> getUser() async {
    return (await _firebaseAuth.currentUser)!.email;
  }
}

class PostDatabase {
  var _firebaseAuth = UserRepository()._firebaseAuth;
  var firestoreInstance = UserRepository()._firestoreInstance;

  PostDatabase({firebaseAuth, firestoreInstance});

  Future<void> addPosttoDatabase(String post) async {
    var username = await UserDatabase().returnUsername();
    var userUid = _firebaseAuth.currentUser!.uid;

    return firestoreInstance
        .collection('post')
        .doc(userUid)
        .set({'post': post, 'username': username});
  }

  Future<List> getData() async {

    Map<String, dynamic> l = {};


    firestoreInstance.collection("post").get().then((querySnapshot) {


      querySnapshot.docs.forEach((value) {
        l['post'](value.data()['post']);
        print("post:" + value.data()['post']);
        print("username" + value.data()['username']);


      });});

   return l;

  }


  }

