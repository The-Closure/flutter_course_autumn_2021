import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/third_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ThirdPage(),
            ),
          );
        },
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(
            tag: 'element',
            child: Container(
              width: 400,
              height: 100,
              color: Colors.red,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: FutureBuilder(
              future: futureInt(),
              builder: (ctxt, asyncData) {
                if (!asyncData.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: Container(
                      child: Text('${asyncData.data}'),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<int> futureInt() {
  return Future.delayed(
    Duration(seconds: 3),
    () async {
      int a = await Random().nextInt(10);
      return a;
    },
  );
}
