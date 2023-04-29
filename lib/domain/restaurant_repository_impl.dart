import 'package:farfor_test_project/configurations/interfaces/restaurant_repository.dart';
import 'package:farfor_test_project/data/models/dish_category.dart';
import 'package:farfor_test_project/data/remote_data_source/resturant_api.dart';

class ResturantRepositoryImpl implements RestaurantRepository {
  ResturantRepositoryImpl({required RestaurantAPI api}) : _api = api;

  final RestaurantAPI _api;

  @override
  Future<List<DishCategory>> fetchDishCategories() async {
    try {
      return await _api.fetchCatalog();
    } catch (e) {
      rethrow;
    }
  }
}
