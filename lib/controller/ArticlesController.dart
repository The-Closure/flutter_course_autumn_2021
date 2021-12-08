import 'package:flutter_course_autumn_2021/models/ArticlesResponse.dart';
import 'package:flutter_course_autumn_2021/service/DataService.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ArticleController extends GetxController {
  DataService dataService = DataService();
  ArticlesResponse data = ArticlesResponse();
  List<Article> _searchList = []; // save response value when use search method
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    data = await dataService.fetchData();
    _searchList = data.article;
    update();
    super.onReady();
  }

  void resetData() {
    data.article = [];
    update();
  }

  void search(String target, [String filter]) {
    !(target == "")
        ? filter == null
            ? _doSearch(target)
            : _doSearch(target, filter)
        : data.article = _searchList;
    update();

    // BEFORE REFACTOR
    // if (filter == null) {
    //    data.article = data.article
    //         .where((element) => element.title.contains(target))
    //         .toList(growable: true);
    //   update();
    // } else {
    //   if (filter == 'title') {
    //     data.article = data.article
    //         .where((element) => element.title.contains(target))
    //         .toList(growable: true);
    //   } else if (filter == 'author') {
    //     data.article = data.article
    //         .where((element) => element.author.contains(target))
    //         .toList(growable: true);
    //   } else if (filter == 'content') {
    //     data.article = data.article
    //         .where((element) => element.content.contains(target))
    //         .toList(growable: true);
    //   }
    // }
  }

  List<Article> _doSearch(String target, [String filter]) {
    return filter == null
        ? data.article = _searchList
            .where((element) => element.title.contains(target))
            .toList(growable: true)
        : data.article = _searchList.where((element) {
            return filter == 'title'
                ? element.title.contains(target)
                : filter == 'author'
                    ? element.author.contains(target)
                    : element.content.contains(target);
          }).toList(growable: true);
  }
}
