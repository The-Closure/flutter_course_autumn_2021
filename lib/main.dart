import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/locations_bloc/locations_bloc.dart';
import 'package:flutter_course_autumn_2021/ui/first_page.dart';
import 'package:flutter_course_autumn_2021/ui/locations_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String token = sharedPreferences.getString('backend_token') ?? 'EMPTY_TOKEN';
  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required String token}) : super(key: key);

  String token = 'EMPTY_TOKEN';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
        BlocProvider<LocationsBloc>(
          create: (_) => LocationsBloc(),
        ),
      ],
      child: MainApp(
        token: token,
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  MainApp({
    Key? key,
    required String? token,
  }) : super(key: key);

  String? token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {'/locations_page': (ctxt) => LocationsPage()},
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: lightTheme().copyWith(
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 14),
          ),
        ),
        home: token == 'EMPTY_TOKEN' ? FirstPage() : LocationsPage());
  }

  ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.indigo,
    ).copyWith(
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 32, color: Colors.indigo),
        bodyText1: TextStyle(color: Colors.black, fontSize: 32),
      ),
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
