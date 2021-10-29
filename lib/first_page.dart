import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/first_page_body.dart';

class RootFirstPage extends InheritedWidget {
  RootFirstPage({Key key, @required this.child})
      : super(key: key, child: child);

  final Widget child;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  static RootFirstPage of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RootFirstPage>();
  }

  @override
  bool updateShouldNotify(RootFirstPage oldWidget) {
    return true;
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RootFirstPage(
      child: Scaffold(
        appBar: AppBar(),
        body: FirstPageBody(),
      ),
    );
  }
}
