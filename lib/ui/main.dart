import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmediapp/ui/welcome.dart';


void main() {
  FirebaseAuth _firebaseAuth; //defining the firebase
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();

  runApp(MaterialApp(debugShowCheckedModeBanner: false,home:Welcome()));
}

