



import 'package:json_annotation/json_annotation.dart';
part 'routes_model.g.dart';

@JsonSerializable(createToJson: false)
class RoutesModel {
    RoutesModel({
        required this.routes,
    });

    final List<Route>? routes;

    RoutesModel copyWith({
        List<Route>? routes,
    }) {
        return RoutesModel(
            routes: routes ?? this.routes,
        );
    }

    factory RoutesModel.fromJson(Map<String, dynamic> json) => _$RoutesModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class Route {
    Route({
        required this.distanceMeters,
        required this.duration,
        required this.polyline,
    });

    final int? distanceMeters;
    final String? duration;
    final Polyline? polyline;

    Route copyWith({
        int? distanceMeters,
        String? duration,
        Polyline? polyline,
    }) {
        return Route(
            distanceMeters: distanceMeters ?? this.distanceMeters,
            duration: duration ?? this.duration,
            polyline: polyline ?? this.polyline,
        );
    }

    factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

}

@JsonSerializable(createToJson: false)
class Polyline {
    Polyline({
        required this.encodedPolyline,
    });

    final String? encodedPolyline;

    Polyline copyWith({
        String? encodedPolyline,
    }) {
        return Polyline(
            encodedPolyline: encodedPolyline ?? this.encodedPolyline,
        );
    }

    factory Polyline.fromJson(Map<String, dynamic> json) => _$PolylineFromJson(json);

}
