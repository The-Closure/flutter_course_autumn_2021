import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/locations_bloc/locations_bloc.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                title: Text('street : ${state.locations[index].street}'),
                subtitle: Text('street : ${state.locations[index].government}'),
              ),
            );
          else
            return Text('something went wrong');
        },
      ),
    );
  }
}
