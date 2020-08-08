import 'package:json_annotation/json_annotation.dart';
part 'food.g.dart';

@JsonSerializable(nullable: false)
class Food {
  final String id;
  final String name;
  final int quantity;

  Food(this.id, this.name, this.quantity);

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
