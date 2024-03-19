




import 'package:json_annotation/json_annotation.dart';
part 'place_details_model.g.dart';

@JsonSerializable(createToJson: false)
class PlaceDetailsModel {
    PlaceDetailsModel({
        required this.htmlAttributions,
        required this.result,
        required this.status,
    });

    @JsonKey(name: 'html_attributions') 
    final List<dynamic>? htmlAttributions;
    final Result? result;
    final String? status;

    PlaceDetailsModel copyWith({
        List<dynamic>? htmlAttributions,
        Result? result,
        String? status,
    }) {
        return PlaceDetailsModel(
            htmlAttributions: htmlAttributions ?? this.htmlAttributions,
            result: result ?? this.result,
            status: status ?? this.status,
        );
    }

    factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) => _$PlaceDetailsModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class Result {
    Result({
        required this.addressComponents,
        required this.adrAddress,
        required this.formattedAddress,
        required this.geometry,
        required this.icon,
        required this.iconBackgroundColor,
        required this.iconMaskBaseUri,
        required this.name,
        required this.photos,
        required this.placeId,
        required this.reference,
        required this.types,
        required this.url,
        required this.utcOffset,
        required this.vicinity,
        required this.website,
    });

    @JsonKey(name: 'address_components') 
    final List<AddressComponent>? addressComponents;

    @JsonKey(name: 'adr_address') 
    final String? adrAddress;

    @JsonKey(name: 'formatted_address') 
    final String? formattedAddress;
    final Geometry? geometry;
    final String? icon;

    @JsonKey(name: 'icon_background_color') 
    final String? iconBackgroundColor;

    @JsonKey(name: 'icon_mask_base_uri') 
    final String? iconMaskBaseUri;
    final String? name;
    final List<Photo>? photos;

    @JsonKey(name: 'place_id') 
    final String? placeId;
    final String? reference;
    final List<String>? types;
    final String? url;

    @JsonKey(name: 'utc_offset') 
    final int? utcOffset;
    final String? vicinity;
    final String? website;

    Result copyWith({
        List<AddressComponent>? addressComponents,
        String? adrAddress,
        String? formattedAddress,
        Geometry? geometry,
        String? icon,
        String? iconBackgroundColor,
        String? iconMaskBaseUri,
        String? name,
        List<Photo>? photos,
        String? placeId,
        String? reference,
        List<String>? types,
        String? url,
        int? utcOffset,
        String? vicinity,
        String? website,
    }) {
        return Result(
            addressComponents: addressComponents ?? this.addressComponents,
            adrAddress: adrAddress ?? this.adrAddress,
            formattedAddress: formattedAddress ?? this.formattedAddress,
            geometry: geometry ?? this.geometry,
            icon: icon ?? this.icon,
            iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
            iconMaskBaseUri: iconMaskBaseUri ?? this.iconMaskBaseUri,
            name: name ?? this.name,
            photos: photos ?? this.photos,
            placeId: placeId ?? this.placeId,
            reference: reference ?? this.reference,
            types: types ?? this.types,
            url: url ?? this.url,
            utcOffset: utcOffset ?? this.utcOffset,
            vicinity: vicinity ?? this.vicinity,
            website: website ?? this.website,
        );
    }

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

}

@JsonSerializable(createToJson: false)
class AddressComponent {
    AddressComponent({
        required this.longName,
        required this.shortName,
        required this.types,
    });

    @JsonKey(name: 'long_name') 
    final String? longName;

    @JsonKey(name: 'short_name') 
    final String? shortName;
    final List<String>? types;

    AddressComponent copyWith({
        String? longName,
        String? shortName,
        List<String>? types,
    }) {
        return AddressComponent(
            longName: longName ?? this.longName,
            shortName: shortName ?? this.shortName,
            types: types ?? this.types,
        );
    }

    factory AddressComponent.fromJson(Map<String, dynamic> json) => _$AddressComponentFromJson(json);

}

@JsonSerializable(createToJson: false)
class Geometry {
    Geometry({
        required this.location,
        required this.viewport,
    });

    final Location? location;
    final Viewport? viewport;

    Geometry copyWith({
        Location? location,
        Viewport? viewport,
    }) {
        return Geometry(
            location: location ?? this.location,
            viewport: viewport ?? this.viewport,
        );
    }

    factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);

}

@JsonSerializable(createToJson: false)
class Location {
    Location({
        required this.lat,
        required this.lng,
    });

    final double? lat;
    final double? lng;

    Location copyWith({
        double? lat,
        double? lng,
    }) {
        return Location(
            lat: lat ?? this.lat,
            lng: lng ?? this.lng,
        );
    }

    factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

}

@JsonSerializable(createToJson: false)
class Viewport {
    Viewport({
        required this.northeast,
        required this.southwest,
    });

    final Location? northeast;
    final Location? southwest;

    Viewport copyWith({
        Location? northeast,
        Location? southwest,
    }) {
        return Viewport(
            northeast: northeast ?? this.northeast,
            southwest: southwest ?? this.southwest,
        );
    }

    factory Viewport.fromJson(Map<String, dynamic> json) => _$ViewportFromJson(json);

}

@JsonSerializable(createToJson: false)
class Photo {
    Photo({
        required this.height,
        required this.htmlAttributions,
        required this.photoReference,
        required this.width,
    });

    final int? height;

    @JsonKey(name: 'html_attributions') 
    final List<String>? htmlAttributions;

    @JsonKey(name: 'photo_reference') 
    final String? photoReference;
    final int? width;

    Photo copyWith({
        int? height,
        List<String>? htmlAttributions,
        String? photoReference,
        int? width,
    }) {
        return Photo(
            height: height ?? this.height,
            htmlAttributions: htmlAttributions ?? this.htmlAttributions,
            photoReference: photoReference ?? this.photoReference,
            width: width ?? this.width,
        );
    }

    factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

}
