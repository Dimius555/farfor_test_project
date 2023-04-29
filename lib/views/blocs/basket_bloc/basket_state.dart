part of 'basket_bloc.dart';

class BasketState {
  final List<BasketDish> dishes;
  final int total;

  BasketState({required this.dishes, this.total = 0});
}
