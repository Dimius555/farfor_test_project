import 'package:farfor_test_project/data/models/basket_dish.dart';
import 'package:farfor_test_project/data/models/dish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  // Статические методы для прослушивания и получения кубита
  static BasketState watchState(BuildContext context) => context.watch<BasketBloc>().state;
  static BasketBloc read(BuildContext context) => context.read<BasketBloc>();

  BasketBloc() : super(BasketState(dishes: [])) {
    on<AddDish>(_addDishToBasket);
    on<RemoveDish>(_removeDishFromBasket);
  }

  void _removeDishFromBasket(RemoveDish event, Emitter<BasketState> emit) {
    final positionForRemoving = state.dishes.firstWhere((element) => element.dish.id == event.dish.id);
    if (positionForRemoving.count == 1) {
      final basketDishes = state.dishes..remove(positionForRemoving);
      final total = _calculateTotalPrice(basketDishes);
      emit(BasketState(dishes: basketDishes, total: total));
    } else {
      final updatedDish = positionForRemoving.copyWith(count: positionForRemoving.count - 1);
      final basketDishes = state.dishes..remove(positionForRemoving);
      basketDishes.add(updatedDish);
      final total = _calculateTotalPrice(basketDishes);
      emit(BasketState(dishes: basketDishes, total: total));
    }
  }

  void _addDishToBasket(AddDish event, Emitter<BasketState> emit) {
    final basketDishes = state.dishes;
    final newDish = _isDishUnique(event.dish);
    if (newDish == null) {
      basketDishes.add(BasketDish(dish: event.dish, count: 1));
    } else {
      final basketDish = basketDishes.firstWhere((element) => element.dish.id == event.dish.id);
      basketDishes.remove(basketDish);
      final refreshedBasketDish = basketDish.copyWith(count: basketDish.count + 1);
      basketDishes.add(refreshedBasketDish);
    }

    final total = _calculateTotalPrice(basketDishes);

    emit(BasketState(dishes: basketDishes, total: total));
  }

  Dish? _isDishUnique(Dish dish) {
    for (var d in state.dishes) {
      if (d.dish.id == dish.id) {
        return dish;
      }
    }
    return null;
  }

  int _calculateTotalPrice(List<BasketDish> list) {
    return 0;
  }
}
