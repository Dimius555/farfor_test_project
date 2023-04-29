// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      id: json['id'] as int,
      imageURL: json['image_url'] as String,
      name: json['name'] as String,
      price: json['cost'] as int,
      weight: json['sizes'] as String,
      categoryID: json['categoryId'] as int,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageURL,
      'name': instance.name,
      'cost': instance.price,
      'sizes': instance.weight,
      'categoryId': instance.categoryID,
      'description': instance.description,
    };
