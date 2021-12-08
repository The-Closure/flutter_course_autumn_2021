import 'package:flutter/material.dart';
import 'package:flutter_course_autumn_2021/models/ArticlesResponse.dart';
import 'package:flutter_course_autumn_2021/service/DataService.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);
  int a;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  ArticlesResponse articlesResponse;
  DataService dataService = DataService();
  @override
  void initState() {
    dataService.fetchData().then((value) {
      setState(() {
        articlesResponse = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('chips'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              height: 100,
              child: ElevatedButton(
                onPressed: () async {
                  articlesResponse = await dataService.fetchData();
                  setState(() {
                    articlesResponse = articlesResponse;
                  });
                },
                child: Text('fetch data'),
              ),
            ),
          ),
          articlesResponse == null
              ? CircularProgressIndicator()
              : Expanded(
                  flex: 6,
                  child: ListView.builder(
                    itemCount: articlesResponse.article?.length ?? 0,
                    itemBuilder: (context, index) => Center(
                      child: Text(
                        '${articlesResponse.article[index].title}',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
