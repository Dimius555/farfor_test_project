import 'package:farfor_test_project/views/widgets/dish_category_widget.dart';
import 'package:flutter/material.dart';

class AppTabPage extends StatelessWidget {
  const AppTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = AppTheme.read(context);
    return Scaffold(
      body: Center(
        child: DishCategoryWidget(
          categoryName: 'Test',
          imageURL: 'https://picsum.photos/200/310',
          onPressed: () {},
        ),
      ),
    );
  }
}
