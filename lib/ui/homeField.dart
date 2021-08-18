import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class G extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(child:    ListView.builder(
        shrinkWrap: true,
        itemCount: 5, // the length
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: FlutterLogo(size: 56.0),
                    title: Text('Item 1'),
                    subtitle: Text('Item 1 subtitle \n jfhjksdhfksdhfksdn\n jdsfnksdnfkjbsd \n\n\n\n\n\n'),
                    trailing: Icon(Icons.access_alarm),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
