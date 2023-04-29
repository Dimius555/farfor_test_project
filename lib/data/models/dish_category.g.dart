// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishCategory _$DishCategoryFromJson(Map<String, dynamic> json) => DishCategory(
      id: json['id'] as int,
      imageURL: json['image_url'] as String,
      name: json['category_name'] as String,
      dishes: (json['products'] as List<dynamic>)
          .map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DishCategoryToJson(DishCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageURL,
      'category_name': instance.name,
      'products': instance.dishes,
    };
