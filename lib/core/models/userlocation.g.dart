// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userlocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    area: json['area'] as String,
    building: json['building'] as String,
    pincode: json['pincode'] as String,
    street: json['street'] as String,
    city: json['city'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'building': instance.building,
      'street': instance.street,
      'area': instance.area,
      'pincode': instance.pincode,
      'city': instance.city,
    };
