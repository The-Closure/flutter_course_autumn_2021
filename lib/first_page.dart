import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(0),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(
              color: Colors.black,
              width: 4,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Row(
                  children: [
                    FlutterLogo(
                      curve: Curves.ease,
                      duration: Duration(
                        seconds: 5,
                      ),
                      size: 50,
                    ),
                    Spacer(),
                    FlutterLogo(
                      curve: Curves.ease,
                      duration: Duration(
                        seconds: 5,
                      ),
                      size: 50,
                    ),
                    FlutterLogo(
                      curve: Curves.ease,
                      duration: Duration(
                        seconds: 5,
                      ),
                      size: 50,
                    ),
                  ],
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  'Three Flutter Logo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
