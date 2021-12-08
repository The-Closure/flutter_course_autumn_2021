import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/controller/ArticlesController.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 100,
              child: TextField(
                controller: searchController,
              ),
            ),
            IconButton(
                onPressed: () {
                  ArticleController controller = Get.find(tag: 'arcCon');
                  controller.search(searchController.text);
                },
                icon: Icon(Icons.search))
          ],
        ),
      ),
      body: GetBuilder<ArticleController>(
        // init: Get.find(tag: 'arcCon'),
        tag: 'arcCon',
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.data?.article?.length ?? 0,
            itemBuilder: (ctxt, index) => Text(
              '${controller.data.article[index].title}',
              style: TextStyle(color: Colors.black, fontSize: 32),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ArticleController controller = Get.find(tag: 'arcCon');
          controller.resetData();
        },
      ),
    );
  }
}
