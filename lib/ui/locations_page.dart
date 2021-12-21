import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/locations_bloc/locations_bloc.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LocationsPage extends StatelessWidget {
  LocationsPage({Key? key}) : super(key: key);
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocationsBloc>(context)
        .add(LoadLocationsEvent(page: 0, size: 4));
    return Scaffold(
      floatingActionButton: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LogOutState)
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/first_page', (route) => !route.isFirst);
        },
        builder: (context, state) {
          if (state is ProcessingLogOutState)
            return CircularProgressIndicator();
          else
            return FabCircularMenu(
                ringWidth: 50,
                ringDiameter: 250,
                ringColor: Colors.red,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                      }),
                  IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        print('Favorite');
                      })
                ]);
        },
      ),
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: BlocBuilder<LocationsBloc, LocationsState>(
        builder: (context, state) {
          if (state is LoadingLocationsState)
            return CircularProgressIndicator();
          else if (state is LocationsErrorState || state is LocationsInitial)
            return ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LocationsBloc>(context)
                      .add(LoadLocationsEvent(page: 0, size: 5));
                },
                child: Text('reload'));
          else if (state is LocationsDataState)
            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              header: WaterDropHeader(),
              onLoading: () {
                _refreshController.loadComplete();
              },
              onRefresh: () {
                BlocProvider.of<LocationsBloc>(context)
                    .add(LoadLocationsEvent(page: 0, size: 10));
                _refreshController.refreshCompleted();
              },
              child: ListView.builder(
                itemCount: state.locations.length,
                itemBuilder: (ctxt, index) => ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text(
                    'street : ${state.locations[index].street}',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  subtitle: Text(
                    'street : ${state.locations[index].government}',
                    style: TextStyle(color: Colors.black.withAlpha(155)),
                  ),
                ),
              ),
            );
          else
            return Text('something went wrong');
        },
      ),
    );
  }
}
