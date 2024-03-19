import 'package:google_map/features/route_tracking/data/models/routes_model/routes_model.dart';
import 'package:location/location.dart';

abstract class RouteTrackingState {}

final class RouteTrackingInitial extends RouteTrackingState {}

final class GetCurrnetLocationLoaded extends RouteTrackingState {
  final LocationData locationData;

  GetCurrnetLocationLoaded(this.locationData);
}

final class GetCurrnetLocationError extends RouteTrackingState {
  final String message;

  GetCurrnetLocationError(this.message);
}

final class GetPlacesLoading extends RouteTrackingState {}

final class GetPlacesLoaded extends RouteTrackingState {}

final class GetPlacesError extends RouteTrackingState {
  final String message;
  GetPlacesError(this.message);
}

final class ClearPlaces extends RouteTrackingState {}

final class ChoosePlace extends RouteTrackingState {}

final class GetPlaceDetailsLoading extends RouteTrackingState {}

final class GetPlaceDetailsLoaded extends RouteTrackingState {}

final class GetPlaceDetailsError extends RouteTrackingState {
  final String message;
  GetPlaceDetailsError(this.message);
}

final class GetRoutesLoading extends RouteTrackingState {}

final class GetRoutesLoaded extends RouteTrackingState {
  final RoutesModel routesModel;

  GetRoutesLoaded(this.routesModel);
}

final class GetRoutesError extends RouteTrackingState {
  final String message;
  GetRoutesError(this.message);
}
