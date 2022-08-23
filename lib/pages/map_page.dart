import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_application/blocs/map/map_bloc.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _mapController = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.maxFinite,
      child: Center(
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            if (state is MapInitial) {
              log('Map Initial State');
            }
            if (state is MapLoaded) {
              LatLng currentLocation = LatLng(
                  state.currentLocation.latitude!.toDouble(),
                  state.currentLocation.longitude!.toDouble());
              log('Map Loaded State');
              return GoogleMap(
                mapType: MapType.terrain,
                initialCameraPosition: CameraPosition(
                  target: currentLocation,
                  zoom: 19,
                ),
                onMapCreated: _onMapCreated,
                markers: {
                  Marker(
                    markerId: const MarkerId('Current Location'),
                    position: currentLocation,
                  ),
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
