import 'package:dio/dio.dart';
import 'package:farfor_test_project/data/models/dish_category.dart';
import 'package:retrofit/retrofit.dart';

part 'resturant_api.g.dart';

@RestApi()
abstract class RestaurantAPI {
  factory RestaurantAPI(Dio dio, {String baseUrl}) = _RestaurantAPI;

  @GET('/moisey312/10b304f7b00ffd17535604f4b38ebe6a/raw/a9e1f131b123aac1d5661215ba54ed164296e866')
  Future<List<DishCategory>> fetchCatalog();
}
