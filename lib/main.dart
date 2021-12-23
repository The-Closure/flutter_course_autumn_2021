import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/locations_bloc/locations_bloc.dart';
import 'package:flutter_course_autumn_2021/service/firestore_service.dart';
import 'package:flutter_course_autumn_2021/ui/firestore_first_page.dart';
import 'package:flutter_course_autumn_2021/ui/firestore_locations_page%20copy.dart';
import 'package:flutter_course_autumn_2021/ui/first_page.dart';
import 'package:flutter_course_autumn_2021/ui/locations_page.dart';
import 'package:flutter_course_autumn_2021/ui/splash_paege.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
}

main() async {
  WidgetsFlutterBinding();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.getToken().then((value) => print(value));
  FirebaseMessaging.onMessage.listen(firebaseMessagingBackgroundHandler);

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
        routes: {
          '/locations_page': (ctxt) => LocationsPage(),
          '/first_page': (ctxt) => FirstPage()
        },
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: lightTheme().copyWith(
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 14),
          ),
        ),
        home: FireStoreUsersPage());
  }

  Future<String> tokenCall() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('backend_token') ?? 'EMPTY_TOKEN';
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

const sharedToken = 'backend_token';
