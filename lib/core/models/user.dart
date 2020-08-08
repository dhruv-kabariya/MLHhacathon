import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(nullable: false)
class User {
  final String id;
  final String name;
  final String email;
  final String phoneNo;
  final String photo;

  User(this.id, this.name, this.email, this.phoneNo, this.photo);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
