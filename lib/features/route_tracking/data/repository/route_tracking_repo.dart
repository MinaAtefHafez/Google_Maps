import 'package:dartz/dartz.dart';
import 'package:google_map/core/error/exceptions.dart';
import 'package:google_map/core/error/failures.dart';
import 'package:google_map/core/helpers/api_helper/api_consumer.dart';
import 'package:google_map/core/helpers/api_helper/end_points.dart';
import 'package:google_map/features/route_tracking/data/models/place_details_model/place_details_model.dart';
import 'package:google_map/features/route_tracking/data/models/routes_model/routes_model.dart';
import 'package:google_map/features/route_tracking/data/models/routes_param_model/routes_param_model.dart';

import '../models/place_model/place_model.dart';

abstract class RouteTrackingRepo {
  Future<Either<Failure, PlaceModel>> getPlace({required String place});
  Future<Either<Failure, PlaceDetailsModel>> getPlaceDetails(
      {required String placeId});
  Future<Either<Failure, RoutesModel>> getRoutes(
      {
      required RoutesParamModel routesParamModel});
}

class RouteTrackingRepoImpl implements RouteTrackingRepo {
  final ApiConsumer _apiConsumer;

  RouteTrackingRepoImpl(this._apiConsumer);

  @override
  Future<Either<Failure, PlaceModel>> getPlace({required String place}) async {
    try {
      final response = await _apiConsumer.get(
          url: EndPoints.place,
          param: {'input': place, 'key': EndPoints.apiKey});
      return right(PlaceModel.fromJson(response));
    } on ServerException catch (e) {
      return left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, PlaceDetailsModel>> getPlaceDetails(
      {required String placeId}) async {
    try {
      final response =
          await _apiConsumer.get(url: EndPoints.placeDetails, param: {
        'key': EndPoints.apiKey,
        'place_id': placeId,
      });
      return right(PlaceDetailsModel.fromJson(response));
    } on ServerException catch (e) {
      return left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, RoutesModel>> getRoutes(
      {
      required RoutesParamModel routesParamModel}) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': EndPoints.apiKey,
        'X-Goog-FieldMask':
            'routes.duration,routes.distanceMeters,routes.polyline',
      };

      final Map<String, dynamic> body = {
        "origin": routesParamModel.origin?.toJson(),
        "destination":routesParamModel.destination?.toJson(),
        "travelMode": "DRIVE",
        "routingPreference": "TRAFFIC_AWARE",
        "computeAlternativeRoutes": false,
        "routeModifiers": routesParamModel.routeModifiers?.toJson() ,
        "languageCode": "en-US",
        "units": "IMPERIAL",
      };
      final response = await _apiConsumer.post(
          url: EndPoints.routes, body: body, headers: headers);
      return right(RoutesModel.fromJson(response));
    } on ServerException catch (e) {
      return left(ServerFailure(e.message!));
    }
  }
}
