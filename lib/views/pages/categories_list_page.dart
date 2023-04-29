import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/models/dish_category.dart';
import 'package:farfor_test_project/views/blocs/dishes_bloc/dishes_bloc.dart';
import 'package:farfor_test_project/views/widgets/dish_category_widget.dart';
import 'package:farfor_test_project/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class CategoriesListPage extends StatelessWidget {
  const CategoriesListPage({super.key, required this.onCategoryPressed});

  final Function(DishCategory category) onCategoryPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final dishState = DishesBloc.watchState(context);
    if (dishState.status is OkDishes) {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 150,
            title: Image.asset('assets/images/promo_image.png'),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: dishState.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return DishCategoryWidget(
                      category: dishState.categories[index],
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => DishesListPage(category: dishState.categories[index])));
                        onCategoryPressed.call(dishState.categories[index]);
                      });
                }),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
          )
        ],
      );
    } else {
      return const LoadingWidget();
    }
  }
}
