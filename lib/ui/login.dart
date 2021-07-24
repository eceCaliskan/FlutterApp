//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:socialmediapp/bloc/authenticate/authenticate_bloc.dart';
import 'package:socialmediapp/bloc/authenticate/authenticate_event.dart';
import 'package:socialmediapp/bloc/login/login_state.dart';
import 'package:socialmediapp/ui/register.dart';
import '../Icon/my_flutter_app_icons.dart';
import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../services/database.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

UserRepository _userRepository = UserRepository();

class _LoginState extends State<Login> {
  TextEditingController textController = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  LoginBloc _loginbloc = LoginBloc(userRepository: _userRepository);
  AuthenticationBloc _authenticationBloc= AuthenticationBloc(userRepository: _userRepository);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _loginbloc,
      builder: (BuildContext context, state)  {
        if (state is LoginSuccess) {
           BlocProvider.of<AuthenticationBloc>(context).add(Auth());
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Home()));
          }
          );

        }
        else if (state is LoginFailure) {
          return Container(
            color: Colors.white,
            child: CupertinoAlertDialog(
              title: Text("Login Filure"),
              content: Text("There is a failure while logging into the account. Please register or check the details"),
        actions: [
            CupertinoDialogAction(
              child: RichText(
                text: TextSpan(
                    text: "Create an account",
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) => Login()))))),
              ],
            ),
          );
        }
        return MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: ListView(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width / 3),
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
                        "Login",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width / 10),
                    Container(
                      child: TextField(
                        controller: textController,
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
                        controller: textController2,
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
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.orange),
                      ),
                      onPressed: () {
                        _loginbloc.add(LoginWithCredentialsPressed(
                            email: textController.text,
                            password: textController2.text));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 30,
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
                                text: "Create an account",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.leftToRight,
                                          child: Register())))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
