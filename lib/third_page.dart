import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/third_page.dart';

class ThirdPage extends StatelessWidget {
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
            child: StreamBuilder(
              stream: seqAsyncValues(),
              builder: (ctxt, asyncData) {
                if (!asyncData.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: Container(
                      child: Text(
                        '${asyncData.data['seconds']}',
                        style: TextStyle(fontSize: 24),
                      ),
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

Stream<Map<String, int>> seqAsyncValues() async* {
  // while (true) {
  //   Future.delayed(Duration(seconds: 1));
  //   DateTime date = new DateTime.now();
  //   yield date;
  // }

  for (var i = 0;; i++) {
    DateTime date = new DateTime.now();
    await Future.delayed(Duration(seconds: 1));
    Map<String, int> dateMap = {
      'hours': date.hour,
      'minutes': date.minute,
      'seconds': date.second
    };
    String format = '${date.hour} : ${date.minute} : ${date.second}';
    yield dateMap;
  }
}
