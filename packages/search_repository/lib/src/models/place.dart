import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:search_repository/src/models/serializers.dart';

part 'place.g.dart';

abstract class Place implements Built<Place, PlaceBuilder> {
  String get name;
  String? get state;
  String? get country;

  bool get hasState => state?.isNotEmpty == true;
  bool get hasCountry => country?.isNotEmpty == true;

  bool get isCountry => hasCountry && name == country;
  bool get isState => hasState && name == state;

  factory Place.fromValues({
    @required name,
    state,
    @required country,
  }) =>
      Place((b) => b
        ..name = name
        ..state = state ?? ''
        ..country = country);

  String get address {
    if (isCountry) return country!;
    return '$name, $level2Address';
  }

  String get addressShort {
    if (isCountry) return country!;
    return '$name, $country';
  }

  String get level2Address {
    if (isCountry || isState || !hasState) return country!;
    if (!hasCountry) return state!;
    return '$state, $country';
  }

  factory Place.fromJson(Map<String, dynamic> json) => Place((b) => b.replace(standardSerializers.deserializeWith(
        Place.serializer,
        json['properties'],
      ) as Place));
  //
  // Place? fromJson(Map<String, dynamic> json) => standardSerializers.deserializeWith(
  //       Place.serializer,
  //       state,
  //     );
  //
  // Map<String, dynamic> toJson(Place place) =>
  //     standardSerializers.serializeWith(Place.serializer, place) as Map<String, dynamic>;

  factory Place([Function(PlaceBuilder b) updates]) = _$Place;
  static Serializer<Place> get serializer => _$placeSerializer;
  Place._();
}
