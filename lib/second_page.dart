import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int index = 1;
  List<Widget> pages = [
    TextButton.icon(
      onPressed: () {
        // Respond to button press
      },
      icon: Icon(Icons.add, size: 18),
      label: Text("TEXT BUTTON"),
    ),
    OutlinedButton.icon(
      onPressed: () {
        // Respond to button press
      },
      icon: Icon(Icons.add, size: 18),
      label: Text("OUTLINED BUTTON"),
    ),
    ElevatedButton.icon(
      onPressed: () {
        // Respond to button press
      },
      icon: Icon(Icons.add, size: 18),
      label: Text("CONTAINED BUTTON"),
    ),
    IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.tap_and_play,
          size: 32,
          color: Color(0xFF6200EE),
        ))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Music',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'Place',
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            label: 'News',
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          // Respond to button press
        },
        icon: Icon(Icons.add),
        label: Text('EXTENDED'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
    );
  }
}
