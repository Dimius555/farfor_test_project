import 'package:farfor_test_project/data/models/dish.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_dish.g.dart';

@JsonSerializable()
class BasketDish {
  @JsonKey(name: 'dish')
  final Dish dish;
  @JsonKey(name: 'count')
  final int count;

  BasketDish({required this.dish, required this.count});

  BasketDish copyWith({int? count, Dish? dish}) {
    return BasketDish(dish: dish ?? this.dish, count: count ?? this.count);
  }

  factory BasketDish.fromJson(Map<String, dynamic> json) => _$BasketDishFromJson(json);

  Map<String, dynamic> toJson() => _$BasketDishToJson(this);
}
