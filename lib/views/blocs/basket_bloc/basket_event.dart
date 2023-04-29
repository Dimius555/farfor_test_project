part of 'basket_bloc.dart';

abstract class BasketEvent {}

class LoadBasket extends BasketEvent {
  final bool isReloading;

  LoadBasket({this.isReloading = false});
}

class AddDish extends BasketEvent {
  final Dish dish;

  AddDish({required this.dish});
}

class RemoveDish extends BasketEvent {
  final Dish dish;

  RemoveDish({required this.dish});
}
