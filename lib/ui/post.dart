import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Container(
            color: Colors.white,
            child: TextField(
              minLines: 6,
               maxLines: 10,
               decoration: InputDecoration(
                 border: OutlineInputBorder( borderSide:  BorderSide(color: Colors.white, width: 2.0),
             ),
                 hoverColor: Colors.orange,

                 hintText: "Enter your post",



               ),
            ),
          ),
        ),
      ),

    );
  }
}
