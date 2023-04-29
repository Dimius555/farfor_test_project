import 'package:farfor_test_project/data/models/dish.dart';

class BasketDish {
  final Dish dish;
  final int count;

  BasketDish({required this.dish, required this.count});

  BasketDish copyWith({int? count, Dish? dish}) {
    return BasketDish(dish: dish ?? this.dish, count: count ?? this.count);
  }
}
