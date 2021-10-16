import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/magic_direction.dart';

class MagicWidget extends StatelessWidget {
  MagicWidget(
    this.direction,
    this.children, {
    Key? key,
  }) : super(key: key);
  MagicDirection direction;
  List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return direction == MagicDirection.horizental
        ? Row(
            children: children,
          )
        : Column(
            children: children,
          );
  }
}
