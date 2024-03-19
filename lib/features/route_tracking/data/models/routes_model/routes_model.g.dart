// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutesModel _$RoutesModelFromJson(Map<String, dynamic> json) => RoutesModel(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Route _$RouteFromJson(Map<String, dynamic> json) => Route(
      distanceMeters: json['distanceMeters'] as int?,
      duration: json['duration'] as String?,
      polyline: json['polyline'] == null
          ? null
          : Polyline.fromJson(json['polyline'] as Map<String, dynamic>),
    );

Polyline _$PolylineFromJson(Map<String, dynamic> json) => Polyline(
      encodedPolyline: json['encodedPolyline'] as String?,
    );
