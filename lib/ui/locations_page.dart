import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/locations_bloc/locations_bloc.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocationsBloc>(context)
        .add(LoadLocationsEvent(page: 0, size: 4));
    return Scaffold(
      floatingActionButton: FabCircularMenu(
          ringWidth: 50,
          ringDiameter: 250,
          ringColor: Colors.red,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  print('Home');
                }),
            IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  print('Favorite');
                })
          ]),
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
            return ListView.builder(
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
            );
          else
            return Text('something went wrong');
        },
      ),
    );
  }
}
