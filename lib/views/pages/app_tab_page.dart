import 'package:farfor_test_project/views/widgets/basket_dish_widget.dart';
import 'package:flutter/material.dart';

class AppTabPage extends StatelessWidget {
  const AppTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = AppTheme.read(context);
    return const Scaffold(
      body: Center(child: BasketDishWidget()),
    );
  }
}
