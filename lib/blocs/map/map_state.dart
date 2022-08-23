part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MapLoaded extends MapState {
  final LocationData currentLocation;

  const MapLoaded({required this.currentLocation});

  @override
  List<Object> get props => [currentLocation];
}
