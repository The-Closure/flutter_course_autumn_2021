import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/locations_bloc/locations_bloc.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter_course_autumn_2021/service/firestorage_service.dart';
import 'package:flutter_course_autumn_2021/service/firestore_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FireStoreUsersPage extends StatefulWidget {
  FireStoreUsersPage({Key? key}) : super(key: key);

  @override
  State<FireStoreUsersPage> createState() => _FireStoreUsersPageState();
}

class _FireStoreUsersPageState extends State<FireStoreUsersPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String imgUrl =
      'https://images.ctfassets.net/hrltx12pl8hq/6TOyJZTDnuutGpSMYcFlfZ/4dfab047c1d94bbefb0f9325c54e08a2/01-nature_668593321.jpg?fit=fill&w=480&h=270';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            FireStorageService fireStorageService = FireStorageService();
            imgUrl = await fireStorageService.downloadURLExample();

            setState(() {
              imgUrl = imgUrl;
            });
          },
        ),
        appBar: AppBar(
          title: Text('Locations'),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
            future: FireStoreService().getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Text(
                  'error',
                  style: TextStyle(color: Colors.black),
                );
              else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (ctxt, index) => Column(
                    children: [
                      Image.network(imgUrl),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        title: Text(
                          'username : ${snapshot.data![index]['username']}',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        subtitle: Text(
                          'password : ${snapshot.data![index]['password']}',
                          style: TextStyle(color: Colors.black.withAlpha(155)),
                        ),
                      ),
                    ],
                  ),
                );
              } else
                return Text(
                  'something went wrong',
                  style: TextStyle(color: Colors.black),
                );
            }));
  }
}
