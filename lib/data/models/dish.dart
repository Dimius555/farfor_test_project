import 'package:json_annotation/json_annotation.dart';

part 'dish.g.dart';

@JsonSerializable()
class Dish {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'image_url')
  final String imageURL;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'cost')
  final int price;

  @JsonKey(name: 'sizes')
  final String weight;

  @JsonKey(name: 'categoryId')
  final int categoryID;

  @JsonKey(name: 'description')
  final String? description;

  Dish({
    required this.id,
    required this.imageURL,
    required this.name,
    required this.price,
    required this.weight,
    required this.categoryID,
    required this.description,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);
}
