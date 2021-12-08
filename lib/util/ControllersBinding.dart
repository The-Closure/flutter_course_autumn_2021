import 'package:flutter_course_autumn_2021/controller/ArticlesController.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

class ControllersBinding extends Bindings {
  @override
  dependencies() {
    print('printing from bindings');
    Get.lazyPut<ArticleController>(() => ArticleController(), tag: 'arcCon');
  }
}
