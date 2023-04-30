import 'package:farfor_test_project/configurations/navigation/page_manager.dart';
import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/configurations/theme/theme_notifier.dart';
import 'package:farfor_test_project/data/models/dish_category.dart';
import 'package:farfor_test_project/service_locator.dart';
import 'package:farfor_test_project/views/widgets/dish_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dish_details_page.dart';

class DishesListPage extends StatelessWidget {
  const DishesListPage({super.key, required this.category});

  static MaterialPage<dynamic> page({required DishCategory category}) {
    return MaterialPage(
      child: DishesListPage(
        category: category,
      ),
      key: const ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/dishes_list';

  final DishCategory category;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeNotifier>().isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name,
          style: AppTheme.read(context).headline1,
        ),
        actions: [
          IconButton(
            onPressed: () {
              sl<ThemeNotifier>().switchTheme();
            },
            icon: isDarkMode ? const Icon(Icons.sunny) : const Icon(Icons.nightlight_round),
          )
        ],
        leading: BackButton(
          onPressed: () => PageManager.read(context).pop(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.66,
                ),
                itemCount: category.dishes.length,
                itemBuilder: (BuildContext context, int index) {
                  return DishListWidget(
                      dish: category.dishes[index],
                      onPressed: () {
                        showModalBottomSheet(
                            useRootNavigator: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (cntxt) {
                              return FractionallySizedBox(
                                heightFactor: 0.9,
                                child: DishDetailsPage(
                                  dish: category.dishes[index],
                                ),
                              );
                            });
                      });
                }),
          ),
        ],
      ),
    );
  }
}
