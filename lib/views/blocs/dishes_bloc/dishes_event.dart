part of 'dishes_bloc.dart';

abstract class DishesEvent {}

class LoadDishes extends DishesEvent {
  final bool isReloading;

  LoadDishes({this.isReloading = false});
}
