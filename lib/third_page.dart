import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                color: Colors.red,
                width: 400,
                height: 400,
              ),
            ),
            Center(
              child: Container(
                color: Colors.black,
                width: 200,
                height: 200,
              ),
            ),
            Center(
              child: Container(
                color: Colors.white,
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
