import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/views/blocs/basket_bloc/basket_bloc.dart';
import 'package:farfor_test_project/views/widgets/basket_dish_widget.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final basketState = BasketBloc.watchState(context);

    if (basketState.dishes.isEmpty) {
      return Center(
        child: Text(
          'Корзина пуста =(\nВы пока ничего не добавили в корзину.',
          textAlign: TextAlign.center,
          style: theme.headline3,
        ),
      );
    }

    if (basketState.dishes.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 5.0),
        child: ListView.builder(
          itemCount: basketState.dishes.length,
          itemBuilder: (context, index) {
            return BasketDishWidget(
              basketDish: basketState.dishes[index],
            );
          },
        ),
      );
    }

    return Container();
  }
}
