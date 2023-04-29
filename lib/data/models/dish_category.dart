import 'package:json_annotation/json_annotation.dart';

import 'dish.dart';

part 'dish_category.g.dart';

@JsonSerializable()
class DishCategory {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'image_url')
  final String imageURL;

  @JsonKey(name: 'category_name')
  final String name;

  @JsonKey(name: 'products')
  final List<Dish> dishes;

  DishCategory({
    required this.id,
    required this.imageURL,
    required this.name,
    required this.dishes,
  });

  factory DishCategory.fromJson(Map<String, dynamic> json) => _$DishCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DishCategoryToJson(this);
}
