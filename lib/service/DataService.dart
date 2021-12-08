import 'dart:convert';

import 'package:flutter_course_autumn_2021/models/ArticlesResponse.dart';
import 'package:http/http.dart' as http;

class DataService {
  final articlesUrl =
      'https://newsapi.org/v2/everything?q=tesla&from=2021-11-06&sortBy=publishedAt&apiKey=a13295a9d18c4bf5a133a2deb1222d95';
  Future<ArticlesResponse> fetchData() async {
    http.Response response = await http.get(Uri.parse(articlesUrl));
    if (response.statusCode == 426) {
      // BAD IDIOT CODE DUE TO NO TOKEN BY API NEWS WEBSITE
      return ArticlesResponse(article: [
        Article(
            title: 'flutter',
            content: 'content',
            description: 'adsfasdfadsf',
            publishedAt: 'asfdads',
            author: 'author'),
        Article(
            title: 'JAVA',
            content: 'content',
            description: 'adsfasdfadsf',
            publishedAt: 'asfdads',
            author: 'author'),
        Article(
            title: 'scala',
            content: 'content',
            description: 'adsfasdfadsf',
            publishedAt: 'asfdads',
            author: 'author'),
        Article(
            title: 'dart',
            content: 'content',
            description: 'adsfasdfadsf',
            publishedAt: 'asfdads',
            author: 'author'),
      ]);
    }
    final mediate = jsonDecode(response.body);
    return ArticlesResponse.fromJson(mediate);
  }
}
