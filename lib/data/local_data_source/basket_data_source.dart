import 'dart:convert';

import 'package:farfor_test_project/data/models/basket_dish.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasketDataSource {
  final SharedPreferences prefs;

  const BasketDataSource({
    required this.prefs,
  });

  static const String _basket = '_basket';

  Future<bool> saveBasketDishes(List<BasketDish> basketDishes) async {
    List<Map<String, dynamic>> listOfMaps = basketDishes.map((e) => e.toJson()).toList();
    String listStr = jsonEncode(listOfMaps);
    return await prefs.setString(_basket, listStr);
  }

  List<BasketDish> fetchBasketDishes() {
    final listStr = prefs.getString(_basket);
    if (listStr != null && listStr != '') {
      final List<dynamic> basketList = jsonDecode(listStr);
      final List<BasketDish> basketDishes = basketList.map((e) => BasketDish.fromJson(e)).toList();
      return basketDishes;
    }

    return [];
  }
}
