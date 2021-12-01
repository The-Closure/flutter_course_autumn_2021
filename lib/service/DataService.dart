import 'dart:convert';

import 'package:flutter_course_autumn_2021/models/ArticlesResponse.dart';
import 'package:http/http.dart' as http;

class DataService {
  final articlesUrl =
      'https://newsapi.org/v2/everything?q=tesla&from=2021-11-01&sortBy=publishedAt&apiKey=a13295a9d18c4bf5a133a2deb1222d95';
  Future<ArticlesResponse> fetchData() async {
    http.Response response = await http.get(Uri.parse(articlesUrl));
    final mediate = jsonDecode(response.body);
    return ArticlesResponse.fromJson(mediate);
  }
}
