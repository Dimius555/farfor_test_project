// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketDish _$BasketDishFromJson(Map<String, dynamic> json) => BasketDish(
      dish: Dish.fromJson(json['dish'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$BasketDishToJson(BasketDish instance) =>
    <String, dynamic>{
      'dish': instance.dish,
      'count': instance.count,
    };
