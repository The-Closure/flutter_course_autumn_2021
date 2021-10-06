import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/first_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MyWidget(
                  content: 'dfsa',
                  title: 'sfd',
                ),
                MyWidget(
                  content: 'dfsa',
                  title: 'sfd',
                ),
                MyWidget(
                  content: 'dfsa',
                  title: 'sfd',
                ),
                MyWidget(
                  content: 'dfsa',
                  title: 'sfd',
                ),
                MyWidget(
                  content: 'dfsa',
                  title: 'sfd',
                ),
              ],
            ),
          ),
          Image.asset(
            'images/pic.png',

            // fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.all(4),
          ),
          Image.network(
            'https://th.bing.com/th/id/R.69ca7ec7e0b6760c682518ace9a128bd?rik=LLLusmA0%2fmPI3Q&riu=http%3a%2f%2fwww.pixelstalk.net%2fwp-content%2fuploads%2f2016%2f05%2fPhotos-Download-Awesome-Wallpapers-HD.jpg&ehk=DbJOem320WxeyLt9NuEMvfGscpwXyEpmM87npdCJPTk%3d&risl=&pid=ImgRaw&r=0',
          ),
        ],
      ),
    );
  }
}
