import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/first_page.dart';
import 'package:get/get.dart';

class SubmitWidget extends StatelessWidget {
  SubmitWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('submit'),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'name : ${RootFirstPage.of(context).nameController.text}, email : ${RootFirstPage.of(context).emailController.text}'),
            backgroundColor: Colors.grey,
            action: SnackBarAction(
              onPressed: () {},
              label: 'ok',
            ),
          ),
        );
      },
    );
  }
}
