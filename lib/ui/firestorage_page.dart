import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/service/firestorage_service.dart';

class FireStoragePage extends StatefulWidget {
  const FireStoragePage({Key? key}) : super(key: key);

  @override
  _FireStoragePageState createState() => _FireStoragePageState();
}

class _FireStoragePageState extends State<FireStoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FireStorageService fireStorage = FireStorageService();
          fireStorage.uploadFile();
        },
      ),
      body: Container(),
    );
  }
}
