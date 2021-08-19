import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmediapp/bloc/post/post_bloc.dart';
import 'package:socialmediapp/bloc/post/post_event.dart';
import 'package:socialmediapp/bloc/post/post_state.dart';
import 'package:socialmediapp/services/database.dart';
import 'package:socialmediapp/ui/homeField.dart';

import 'home.dart';

class Post extends StatefulWidget {
  @override

  @override
  _Post createState() => _Post();
}

class _Post extends State<Post> {
  TextEditingController textController = TextEditingController();
  PostDatabase _userRepository = PostDatabase();

  @override
  Widget build(BuildContext context) {
    PostBloc _postBloc = new PostBloc(postDatabase: _userRepository);
    _postBloc.add(ReturnPost());
    return BlocBuilder(
        bloc: _postBloc,
        builder: (BuildContext context, state) {
          if (state is ReturnedFromTheDatabase) {
            String posts = state.postList;

            //BlocProvider.of<AuthenticationBloc>(context).add(Auth());
            //Future.delayed(const Duration(milliseconds: 500), () {
            //Navigator.push(context,
            // MaterialPageRoute(builder: (BuildContext context) => G()));
            // });
            // }
            return ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20.0, top: 15.0, left: 5.0),
                  child: Row(children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        //  padding: EdgeInsets.only(right: ),
                        color: Colors.white,
                        child: TextField(
                          controller: textController,
                          minLines: 1,
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            hoverColor: Colors.orange,
                            hintText: "Enter your post",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            _postBloc.add(AddPost(textController.text));
                            //_postBloc.add(ReturnPost());
                          }),
                    ),
                  ]),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5, // the length
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                               ListTile(
                                leading: FlutterLogo(size: 56.0),
                                title: Text('Item 1'),
                                subtitle: Text(
                                    state.postList),
                                trailing: Icon(Icons.access_alarm),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            );
          } else {
            return ListView(shrinkWrap: true, children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, top: 15.0, left: 5.0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(
                      //  padding: EdgeInsets.only(right: ),
                      color: Colors.white,
                      child: TextField(
                        controller: textController,
                        minLines: 1,
                        maxLines: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          hoverColor: Colors.orange,
                          hintText: "Enter your post",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          _postBloc.add(AddPost(textController.text));
                          //_postBloc.add(ReturnPost());
                        }),
                  ),
                ]),
              ),
            ]);
          }
          Container();
        });
  }
}
