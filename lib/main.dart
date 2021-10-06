import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => SecondPage(),
            ),
          );
        },
      ),
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: 'element',
          child: AnimatedContainer(
            duration: Duration(seconds: 5),
            width: 200,
            height: 400,
            color: Colors.blue,
            padding: EdgeInsets.only(top: 100),
            child: AnimatedAlign(
              child: Text('data'),
              alignment: Alignment.topCenter,
              curve: Curves.easeIn,
              duration: Duration(seconds: 5),
            ),
          ),
        ),
      ),
    );
  }
}
