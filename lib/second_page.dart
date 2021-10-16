import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String email;
  String password;
  SecondPage({Key key, @required this.email, @required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map userInfo = RouteSettings(name: 'userInfo').arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$email'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$password'),
            ),
          ],
        ),
      ),
    );
  }
}
