import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmediapp/bloc/authenticate/authenticate_bloc.dart';
import 'package:socialmediapp/bloc/authenticate/authenticate_event.dart';
import 'package:socialmediapp/bloc/register/register_bloc.dart';
import 'package:socialmediapp/bloc/register/register_event.dart';
import 'package:socialmediapp/bloc/register/register_state.dart';
import 'package:socialmediapp/services/database.dart';
import 'package:socialmediapp/ui/login.dart';
import '../Icon/my_flutter_app_icons.dart';
import 'home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  TextEditingController textController = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  UserRepository _userRepository = UserRepository();




  @override
  Widget build(BuildContext context) {
    RegisterBloc _registerBloc= RegisterBloc(userRepository: _userRepository);
    AuthenticationBloc _authenticationBloc= AuthenticationBloc(userRepository: _userRepository);

    return BlocBuilder(


     bloc: _registerBloc,
      builder: (BuildContext context, state) {
       if(state is RegisterSuccess){
         //BlocProvider.of<AuthenticationBloc>(context).add(Auth());
         Future.delayed(const Duration(milliseconds: 500), () {
           Navigator.push(context,
               MaterialPageRoute(builder: (BuildContext context) => Home()));
         }
         );
       }
       else {
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
                 width: MediaQuery
                     .of(context)
                     .size
                     .width / 1.4,
                 child: ListView(
                   children: [
                     SizedBox(height: MediaQuery
                         .of(context)
                         .size
                         .width / 6),
                     SizedBox(width: MediaQuery
                         .of(context)
                         .size
                         .width / 3),
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
                     SizedBox(height: MediaQuery
                         .of(context)
                         .size
                         .width / 10),
                     Container(
                       child: TextField(
                         controller: textController,
                         decoration: InputDecoration(
                             icon: Icon(Icons.perm_identity_sharp),
                             floatingLabelBehavior: FloatingLabelBehavior.auto,
                             labelText: 'Enter Username',
                             hintText: 'Enter Your Username'),
                       ),
                     ),
                     Container(
                       child: TextField(
                         controller: textController2,
                         decoration: InputDecoration(
                             icon: Icon(Icons.perm_identity_sharp),
                             floatingLabelBehavior: FloatingLabelBehavior.auto,
                             labelText: 'Enter Email',
                             hintText: 'Enter Your Email'),
                       ),
                     ),
                     Container(
                       width: MediaQuery
                           .of(context)
                           .size
                           .width / 1,
                       child: TextField(
                         controller: textController3,
                         decoration: InputDecoration(
                             icon: Icon(Icons.lock),
                             floatingLabelBehavior: FloatingLabelBehavior.auto,
                             labelText: 'Enter Password',
                             hintText: 'Enter Your Password'),
                       ),
                     ),
                     SizedBox(
                       height: MediaQuery
                           .of(context)
                           .size
                           .width / 13,
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
                             onPressed: () {
                               _registerBloc.add(RegistertoApp(
                                   textController.text,
                                   textController2.text,
                                   textController3.text));
                             },
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
                       height: MediaQuery
                           .of(context)
                           .size
                           .width / 15,
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
       return Container();},
      );

  }
}
