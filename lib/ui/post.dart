import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmediapp/bloc/post/post_bloc.dart';
import 'package:socialmediapp/bloc/post/post_state.dart';
import 'package:socialmediapp/services/database.dart';

import 'home.dart';

class Post extends StatefulWidget{
  @override

  const Post({Key? key}) : super(key: key);

  @override
  _Post createState() => _Post();
}


class _Post extends State<Post> {
  UserRepository _userRepository = UserRepository();


  @override
  Widget build(BuildContext context) {
    PostBloc _postBloc = new PostBloc(userRepository: _userRepository);

    return BlocBuilder(
        bloc: _postBloc,
        builder: (BuildContext context, state) {
          if (state is AdddedToTheDatabase) {
            //BlocProvider.of<AuthenticationBloc>(context).add(Auth());
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            }
            );
          }

          return Scaffold(
            body: ListView(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: TextField(
                    minLines: 1,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      hoverColor: Colors.orange,
                      hintText: "Enter your post",
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .width / 0.9,
                  //width: 1000,
                  color: Colors.pink,
                  child: Text("hellsdkgşkfsgkşfgkşfdkggdfhnfghrfg"),
                ),
              ],
            ),

          );
        }
    );


  }
}
