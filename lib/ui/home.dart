import 'package:flutter/material.dart';
import 'package:socialmediapp/ui/post.dart';

/// This is the stateful widget that the main application instantiates.
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _Home();
}
/// This is the private State class that goes with MyStatefulWidget.
class _Home extends State<Home> {
     int _selectedIndex = 0;
     static const TextStyle optionStyle =
     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

     static List<Widget> _widgetOptions = <Widget>[
          Post(),

     ];

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: const Text('Connect', style: TextStyle(color: Colors.orange),)),
        iconTheme: IconThemeData(color: Colors.black),

      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
               icon: Icon(Icons.home),
               label: 'Home',
            ),
            BottomNavigationBarItem(
               icon: Icon(Icons.post_add),
               label: 'Post',
            ),
            BottomNavigationBarItem(
               icon: Icon(Icons.message),
               label: 'Message',
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }
}
