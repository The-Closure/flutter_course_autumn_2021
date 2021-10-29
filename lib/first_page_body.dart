import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/first_page.dart';
import 'package:flutter_course_autumn_2021/first_page_submit.dart';

class FirstPageBody extends StatelessWidget {
  FirstPageBody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: RootFirstPage.of(context).emailController,
          ),
          TextField(
            controller: RootFirstPage.of(context).nameController,
          ),
          SubmitWidget()
        ],
      ),
    );
  }
}
