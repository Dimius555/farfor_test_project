import 'package:farfor_test_project/data/models/dish_category.dart';

abstract class RestaurantRepository {
  Future<List<DishCategory>> fetchDishCategories();
}
