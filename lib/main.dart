import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/second_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: lightTheme().copyWith(
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 14),
        ),
      ),
      home: SecondPage(),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.indigo,
    ).copyWith(
      textTheme:
          TextTheme(headline1: TextStyle(fontSize: 32, color: Colors.indigo)),
      chipTheme: ChipThemeData(
          padding: EdgeInsets.all(0),
          backgroundColor: Colors.indigo.shade400,
          disabledColor: Colors.white,
          selectedColor: Colors.indigo,
          secondarySelectedColor: Colors.blue,
          labelStyle: TextStyle(fontSize: 16),
          secondaryLabelStyle: TextStyle(fontSize: 14),
          brightness: Brightness.light),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 10)),
          backgroundColor: MaterialStateProperty.all(Colors.indigo),
        ),
      ),
    );
  }
}
