import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialmediapp/ui/login.dart';
import '../Icon/my_flutter_app_icons.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                )),
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.4,
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.width / 6),
                SizedBox(width: MediaQuery.of(context).size.width / 3),
                Container(
                  child: Image.asset(
                    'assets/world2.jpg',
                    height: 100,
                  ),
                ),
                Center(
                  child: Container(
                      child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  )),
                ),
                SizedBox(height: MediaQuery.of(context).size.width / 10),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.perm_identity_sharp),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Enter Username',
                        hintText: 'Enter Your Username'),
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.perm_identity_sharp),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Enter Email',
                        hintText: 'Enter Your Email'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Enter Password',
                        hintText: 'Enter Your Password'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 13,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.orange,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          MyFlutterApp.google,
                          color: Colors.orange,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          MyFlutterApp.twitter,
                          color: Colors.orange,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 15,
                  child: Center(
                    child: RichText(
                        text: TextSpan(
                      text: "Do you have an account? Login",
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
