import 'package:farfor_test_project/configurations/interfaces/restaurant_repository.dart';
import 'package:farfor_test_project/data/models/dish_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'dishes_event.dart';
part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  // Статические методы для прослушивания и получения кубита
  static DishesState watchState(BuildContext context) => context.watch<DishesBloc>().state;
  static DishesBloc read(BuildContext context) => context.read<DishesBloc>();

  final RestaurantRepository _restaurantRepository;

  DishesBloc({required RestaurantRepository restaurantRepository})
      : _restaurantRepository = restaurantRepository,
        super(DishesState(categories: [], status: LoadingDishes())) {
    on<DishesEvent>(_loadDishes);
  }

  _loadDishes(DishesEvent event, Emitter<DishesState> emit) async {
    try {
      emit(state.copyWith(status: LoadingDishes()));
      final categories = await _restaurantRepository.fetchDishCategories();
      emit(state.copyWith(categories: categories, status: OkDishes()));
    } catch (e) {
      emit(state.copyWith(status: OkDishes()));
    }
  }
}
