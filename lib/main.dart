import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/first_page.dart';
import 'package:flutter_course_autumn_2021/second_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      routes: {
        '/first_page': (context) => FirstPage(),
        '/second_page': (context) => SecondPage()
      },
    );
  }
}
