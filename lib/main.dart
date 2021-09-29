import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/new_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NewPage(),
            ),
          );
        },
      ),
      appBar: AppBar(),
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
