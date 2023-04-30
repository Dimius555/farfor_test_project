import 'package:farfor_test_project/data/models/basket_dish.dart';

abstract class BasketRepository {
  Future<void> saveBasketDishes(List<BasketDish> dishes);
  List<BasketDish> fetchBasketDishes();
}
