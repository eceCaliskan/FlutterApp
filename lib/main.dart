import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmediapp/welcome.dart';


void main() {
  FirebaseAuth _firebaseAuth; //defining the firebase


  runApp(MaterialApp(debugShowCheckedModeBanner: false,home:Welcome()));
}

