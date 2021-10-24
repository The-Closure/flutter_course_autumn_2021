import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String email;
  String password;
  SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> info = ModalRoute.of(context).settings.arguments as Map;
    Map userInfo = RouteSettings(name: 'userInfo').arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${info['email']}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${info['password']}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop({'returnedData': 'second_page_pop'});
                  },
                  child: Text('back')),
            ),
          ],
        ),
      ),
    );
  }
}
