import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/magic_direction.dart';
import 'package:flutter_course_autumn_2021/magic_widget.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MagicWidget(
        MediaQuery.of(context).size.height / MediaQuery.of(context).size.width >
                1
            ? MagicDirection.vertical
            : MagicDirection.horizental,
        [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('first grid'),
          ),
          FirstGrid(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('second grid'),
          ),
          SecondGrid(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('third grid'),
          ),
          ThirdGrid(),
        ],
      ),
    );
  }
}

class FirstGrid extends StatelessWidget {
  const FirstGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 1,
        child: GridView.builder(
          itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2),
          itemBuilder: (ctxt, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              color: Color.fromRGBO(
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(10) / 10,
              ),
              // height: 75,
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 25,
                color: Colors.white,
                child: Text('data $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondGrid extends StatelessWidget {
  const SecondGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 1,
        child: GridView.builder(
          itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (ctxt, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              color: Color.fromRGBO(
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(10) / 10,
              ),
              // height: 150,
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://live.staticflickr.com/6/5915625_080367c777.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ThirdGrid extends StatelessWidget {
  const ThirdGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 1,
        child: GridView.builder(
          itemCount: 100,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (ctxt, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              color: Color.fromRGBO(
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(10) / 10,
              ),
              height: 75,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 75,
                    color: Colors.white,
                    child: Text('data $index'),
                  ),
                  Container(
                    margin: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://live.staticflickr.com/6/5915625_080367c777.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
