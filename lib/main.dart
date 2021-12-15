import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/locations_bloc/locations_bloc.dart';
import 'package:flutter_course_autumn_2021/ui/first_page.dart';
import 'package:flutter_course_autumn_2021/ui/locations_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/locations_page': (_) => LocationsPage()},
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: lightTheme().copyWith(
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 14),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(),
          ),
          BlocProvider<LocationsBloc>(
            create: (_) =>
                LocationsBloc()..add(LoadLocationsEvent(page: 0, size: 4)),
          ),
        ],
        child: LocationsPage(),
      ),
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
