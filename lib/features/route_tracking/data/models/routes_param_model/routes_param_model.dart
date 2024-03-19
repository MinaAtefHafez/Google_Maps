import 'package:json_annotation/json_annotation.dart';

part 'routes_param_model.g.dart';

@JsonSerializable()
class RoutesParamModel {
    RoutesParamModel({
         this.origin,
         this.destination,
         this.routeModifiers,
    });

     Destination? origin;
     Destination? destination;
     RouteModifiers? routeModifiers;

    RoutesParamModel copyWith({
        Destination? origin,
        Destination? destination,
        RouteModifiers? routeModifiers,
    }) {
        return RoutesParamModel(
            origin: origin ?? this.origin,
            destination: destination ?? this.destination,
            routeModifiers: routeModifiers ?? this.routeModifiers,
        );
    }

    factory RoutesParamModel.fromJson(Map<String, dynamic> json) => _$RoutesParamModelFromJson(json);

    Map<String, dynamic> toJson() => _$RoutesParamModelToJson(this);

}

@JsonSerializable()
class Destination {
    Destination({
         this.location,
    });

     Location? location;

    Destination copyWith({
        Location? location,
    }) {
        return Destination(
            location: location ?? this.location,
        );
    }

    factory Destination.fromJson(Map<String, dynamic> json) => _$DestinationFromJson(json);

    Map<String, dynamic> toJson() => _$DestinationToJson(this);

}

@JsonSerializable()
class Location {
    Location({
         this.latLng,
    });

     LatLng? latLng;

    Location copyWith({
        LatLng? latLng,
    }) {
        return Location(
            latLng: latLng ?? this.latLng,
        );
    }

    factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

    Map<String, dynamic> toJson() => _$LocationToJson(this);

}

@JsonSerializable()
class LatLng {
    LatLng({
         this.latitude,
         this.longitude,
    });

     double? latitude;
     double? longitude;

    LatLng copyWith({
        double? latitude,
        double? longitude,
    }) {
        return LatLng(
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
        );
    }

    factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);

    Map<String, dynamic> toJson() => _$LatLngToJson(this);

}

@JsonSerializable()
class RouteModifiers {
    RouteModifiers({
         this.avoidTolls,
         this.avoidHighways,
         this.avoidFerries,
    });

     bool? avoidTolls;
     bool? avoidHighways;
     bool? avoidFerries;

    RouteModifiers copyWith({
        bool? avoidTolls,
        bool? avoidHighways,
        bool? avoidFerries,
    }) {
        return RouteModifiers(
            avoidTolls: avoidTolls ?? this.avoidTolls,
            avoidHighways: avoidHighways ?? this.avoidHighways,
            avoidFerries: avoidFerries ?? this.avoidFerries,
        );
    }

    factory RouteModifiers.fromJson(Map<String, dynamic> json) => _$RouteModifiersFromJson(json);

    Map<String, dynamic> toJson() => _$RouteModifiersToJson(this);

}
