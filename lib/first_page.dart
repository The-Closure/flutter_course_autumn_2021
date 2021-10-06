import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/data.dart';
import 'package:flutter_course_autumn_2021/second_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SecondPage(),
              ),
            );
          },
        ),
        appBar: AppBar(),
        body: Column(
          children: [DataView(3), DataView(3), GridDataView()],
        ),
      ),
    );
  }
}

class GridDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctxt, index) {
          return MyWidget(
            title: data[index]['title'],
            content: data[index]['content'],
          );
        },
      ),
    );
  }
}

class DataView extends StatelessWidget {
  final int flex;
  DataView(this.flex);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (ctxt, index) {
          return MyWidget(
            title: data[index]['title'],
            content: data[index]['content'],
          );
        },
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String title;
  final String content;
  MyWidget({@required this.title, @required this.content});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$title',
            style: TextStyle(fontSize: 48),
          ),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                // fit: BoxFit.fitHeight,
                image: AssetImage('images/pic.png'),
              ),
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.content_paste,
                  color: Colors.grey,
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                ),
                Text(
                  '$content',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
