import 'package:farfor_test_project/data/models/dish_category.dart';
import 'package:farfor_test_project/views/widgets/dish_list_widget.dart';
import 'package:flutter/material.dart';

import 'dish_details_page.dart';

class DishesListPage extends StatelessWidget {
  const DishesListPage({super.key, required this.category});

  final DishCategory category;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
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
    );
  }
}
