import 'package:farfor_test_project/configurations/interfaces/basket_repository.dart';
import 'package:farfor_test_project/data/local_data_source/basket_data_source.dart';
import 'package:farfor_test_project/data/models/basket_dish.dart';

class BasketRepositoryImpl implements BasketRepository {
  final BasketDataSource _dataSource;

  BasketRepositoryImpl({required BasketDataSource dataSource}) : _dataSource = dataSource;

  @override
  List<BasketDish> fetchBasketDishes() {
    return _dataSource.fetchBasketDishes();
  }

  @override
  Future<void> saveBasketDishes(List<BasketDish> dishes) async {
    await _dataSource.saveBasketDishes(dishes);
  }
}
