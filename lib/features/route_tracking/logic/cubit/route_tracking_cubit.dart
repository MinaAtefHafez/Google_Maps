import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map/core/helpers/location_helper/location_helper.dart';
import 'package:google_map/features/route_tracking/data/models/place_details_model/place_details_model.dart';
import 'package:google_map/features/route_tracking/data/models/place_model/place_model.dart';
import 'package:google_map/features/route_tracking/data/models/routes_model/routes_model.dart';
import 'package:google_map/features/route_tracking/data/models/routes_param_model/routes_param_model.dart';
import 'package:google_map/features/route_tracking/data/repository/route_tracking_repo.dart';
import 'package:google_map/features/route_tracking/logic/cubit/route_tracking_state.dart';
import 'package:location/location.dart';

class RouteTrackingCubit extends Cubit<RouteTrackingState> {
  RouteTrackingCubit(this._routeTrackingRepo, this.locationHelper)
      : super(RouteTrackingInitial());

  final RouteTrackingRepo _routeTrackingRepo;
  final LocationHelper locationHelper;
  LocationData? locationData;
  PlaceModel? placeModel;
  Prediction? choosenPlace;
  PlaceDetailsModel? placeDetails;
  RoutesModel? routesModel;
  Destination origin = Destination();
  Destination destination = Destination();
  RoutesParamModel routesParamModel = RoutesParamModel();
  Future<void> getCurrentLocation() async {
    try {
      locationData = await locationHelper.getCurrentLocation();
      emit(GetCurrnetLocationLoaded(locationData!));
    } on LocationServiceException catch (e) {
      emit(GetCurrnetLocationError(e.toString()));
    } on LocationPermissionException catch (e) {
      emit(GetCurrnetLocationError(e.toString()));
    }
  }

  Future<void> getPlaces({required String place}) async {
    emit(GetPlacesLoading());
    final result = await _routeTrackingRepo.getPlace(place: place);
    result.fold(
      (l) => emit(GetPlacesError(l.message)),
      (r) {
        placeModel = r;

        emit(GetPlacesLoaded());
      },
    );
  }

  bool get isPlacesEmpty {
    if (placeModel != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> clearPlaces() async {
    placeModel!.predictions!.clear();
    emit(ClearPlaces());
  }

  void choosePlace({required Prediction place}) async {
    choosenPlace = place;
    await getPlaceDetails();
    emit(ChoosePlace());
  }

  Future<void> getPlaceDetails() async {
    emit(GetPlaceDetailsLoading());
    final result = await _routeTrackingRepo.getPlaceDetails(
        placeId: choosenPlace!.placeId!);
    result.fold((l) {
      emit(GetPlaceDetailsError(l.message));
    }, (r) {
      placeDetails = r;
      emit(GetPlaceDetailsLoaded());
      getRoutes();
    });
  }

  Future<void> onOriginDestinationChanged() async {
    routesParamModel.origin?.location?.latLng = origin.location?.latLng
        ?.copyWith(
            latitude: locationData!.latitude,
            longitude: locationData!.longitude);
  }

  Future<void> onDestinationChanged() async {
    routesParamModel.destination?.location?.latLng =
        destination.location?.latLng?.copyWith(
            latitude: placeDetails!.result!.geometry!.location!.lat,
            longitude: placeDetails!.result!.geometry!.location!.lng);
  }

  Future<void> getRoutes() async {
    emit(GetRoutesLoading());
    await onOriginDestinationChanged();
    await onDestinationChanged();
    final result = await _routeTrackingRepo.getRoutes(
      routesParamModel: routesParamModel,
    );
    result.fold((l) {
      emit(GetRoutesError(l.message));
    }, (r) {
      emit(GetRoutesLoaded(r));
    });
  }

  @override
  void onChange(Change<RouteTrackingState> change) {
    log(change.currentState.toString());
    super.onChange(change);
  }
}
