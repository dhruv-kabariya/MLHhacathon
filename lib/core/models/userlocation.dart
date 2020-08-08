import 'package:json_annotation/json_annotation.dart';
part 'userlocation.g.dart';

@JsonSerializable(nullable: false)
class Location {
  final String building;
  final String street;
  final String area;
  final String city;
  final String pincode;
  Location({this.area, this.city, this.building, this.pincode, this.street});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
