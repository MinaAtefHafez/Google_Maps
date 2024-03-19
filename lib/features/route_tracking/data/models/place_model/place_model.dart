



import 'package:json_annotation/json_annotation.dart';

part 'place_model.g.dart';

@JsonSerializable(createToJson: false)
class PlaceModel {
    PlaceModel({
        required this.predictions,
        required this.status,
    });

    final List<Prediction>? predictions;
    final String? status;

    PlaceModel copyWith({
        List<Prediction>? predictions,
        String? status,
    }) {
        return PlaceModel(
            predictions: predictions ?? this.predictions,
            status: status ?? this.status,
        );
    }

    factory PlaceModel.fromJson(Map<String, dynamic> json) => _$PlaceModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class Prediction {
    Prediction({
        required this.description,
        required this.matchedSubstrings,
        required this.placeId,
        required this.reference,
        required this.structuredFormatting,
        required this.terms,
        required this.types,
    });

    final String? description;

    @JsonKey(name: 'matched_substrings') 
    final List<MatchedSubstring>? matchedSubstrings;

    @JsonKey(name: 'place_id') 
    final String? placeId;
    final String? reference;

    @JsonKey(name: 'structured_formatting') 
    final StructuredFormatting? structuredFormatting;
    final List<Term>? terms;
    final List<String>? types;

    Prediction copyWith({
        String? description,
        List<MatchedSubstring>? matchedSubstrings,
        String? placeId,
        String? reference,
        StructuredFormatting? structuredFormatting,
        List<Term>? terms,
        List<String>? types,
    }) {
        return Prediction(
            description: description ?? this.description,
            matchedSubstrings: matchedSubstrings ?? this.matchedSubstrings,
            placeId: placeId ?? this.placeId,
            reference: reference ?? this.reference,
            structuredFormatting: structuredFormatting ?? this.structuredFormatting,
            terms: terms ?? this.terms,
            types: types ?? this.types,
        );
    }

    factory Prediction.fromJson(Map<String, dynamic> json) => _$PredictionFromJson(json);

}

@JsonSerializable(createToJson: false)
class MatchedSubstring {
    MatchedSubstring({
        required this.length,
        required this.offset,
    });

    final int? length;
    final int? offset;

    MatchedSubstring copyWith({
        int? length,
        int? offset,
    }) {
        return MatchedSubstring(
            length: length ?? this.length,
            offset: offset ?? this.offset,
        );
    }

    factory MatchedSubstring.fromJson(Map<String, dynamic> json) => _$MatchedSubstringFromJson(json);

}

@JsonSerializable(createToJson: false)
class StructuredFormatting {
    StructuredFormatting({
        required this.mainText,
        required this.mainTextMatchedSubstrings,
        required this.secondaryText,
    });

    @JsonKey(name: 'main_text') 
    final String? mainText;

    @JsonKey(name: 'main_text_matched_substrings') 
    final List<MatchedSubstring>? mainTextMatchedSubstrings;

    @JsonKey(name: 'secondary_text') 
    final String? secondaryText;

    StructuredFormatting copyWith({
        String? mainText,
        List<MatchedSubstring>? mainTextMatchedSubstrings,
        String? secondaryText,
    }) {
        return StructuredFormatting(
            mainText: mainText ?? this.mainText,
            mainTextMatchedSubstrings: mainTextMatchedSubstrings ?? this.mainTextMatchedSubstrings,
            secondaryText: secondaryText ?? this.secondaryText,
        );
    }

    factory StructuredFormatting.fromJson(Map<String, dynamic> json) => _$StructuredFormattingFromJson(json);

}

@JsonSerializable(createToJson: false)
class Term {
    Term({
        required this.offset,
        required this.value,
    });

    final int? offset;
    final String? value;

    Term copyWith({
        int? offset,
        String? value,
    }) {
        return Term(
            offset: offset ?? this.offset,
            value: value ?? this.value,
        );
    }

    factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

}
