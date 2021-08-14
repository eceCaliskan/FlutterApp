import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: <Widget>[
          Container(height: MediaQuery
          .of(context)
          .size
          .width / 0.9

            ,width: 1000, color: Colors.pink,
          child: Text("hellsdkgşkfsgkşfgkşfdkggdfhnfghrfg"),

          ),



        Container(
              color: Colors.white,
              child: TextField(
                minLines: 1,
                 maxLines: 10,
                 decoration: InputDecoration(
                   border: OutlineInputBorder( borderSide:  BorderSide(color: Colors.white, width: 2.0),
               ),
                   hoverColor: Colors.orange,

                   hintText: "Enter your post",



                 ),
              ),
            ),
        ],
          ),



    );
  }
}
