part of 'dishes_bloc.dart';

class DishesState {
  final List<DishCategory> categories;
  final DishesStatus status;

  DishesState({
    required this.categories,
    required this.status,
  });

  DishesState copyWith({List<DishCategory>? categories, DishesStatus? status}) {
    return DishesState(categories: categories ?? this.categories, status: status ?? this.status);
  }
}

abstract class DishesStatus {}

class LoadingDishes extends DishesStatus {}

class OkDishes extends DishesStatus {}
