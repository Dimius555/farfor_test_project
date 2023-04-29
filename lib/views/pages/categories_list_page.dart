import 'package:farfor_test_project/configurations/navigation/page_manager.dart';
import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/views/blocs/dishes_bloc/dishes_bloc.dart';
import 'package:farfor_test_project/views/pages/dishes_list_page.dart';
import 'package:farfor_test_project/views/widgets/dish_category_widget.dart';
import 'package:farfor_test_project/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class CategoriesListPage extends StatelessWidget {
  const CategoriesListPage({super.key});

  static MaterialPage<dynamic> page() {
    return const MaterialPage(
      child: CategoriesListPage(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/categories_list';

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
                        PageManager.read(context).push(DishesListPage.page(category: dishState.categories[index]));
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
