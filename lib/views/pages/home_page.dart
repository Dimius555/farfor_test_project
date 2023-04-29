import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/constants.dart';
import 'package:farfor_test_project/data/models/dish_category.dart';
import 'package:farfor_test_project/views/blocs/basket_bloc/basket_bloc.dart';
import 'package:farfor_test_project/views/pages/dishes_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'basket_page.dart';
import 'categories_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  DishCategory? dishCategory;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final basketState = BasketBloc.watchState(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_page == 0 ? 'Категории' : 'Корзина', style: theme.headline1),
        leading: _page == 0
            ? dishCategory == null
                ? null
                : BackButton(onPressed: () {
                    setState(() {
                      dishCategory = null;
                    });
                  })
            : BackButton(onPressed: () {
                setState(() {
                  _page = 0;
                });
              }),
      ),
      body: _getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon:
                  SvgPicture.asset(AppIcons.iconMenu, color: _page == 0 ? theme.bottomNavigationItemSelectedColor : theme.bottomNavigationItemUnselectedColor),
              label: 'Еда'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(basketState.dishes.isEmpty ? AppIcons.iconBasketEmpty : AppIcons.iconBasketFilled,
                  color: _page == 1 ? theme.bottomNavigationItemSelectedColor : theme.bottomNavigationItemUnselectedColor),
              label: 'Корзина'),
        ],
        onTap: onPageChange,
        currentIndex: _page,
        backgroundColor: theme.primaryBackgroundColor,
        selectedItemColor: theme.bottomNavigationItemSelectedColor,
        unselectedItemColor: theme.bottomNavigationItemUnselectedColor,
        selectedLabelStyle: theme.caption1.copyWith(color: theme.bottomNavigationItemSelectedColor),
        unselectedLabelStyle: theme.caption1.copyWith(color: theme.bottomNavigationItemUnselectedColor),
      ),
    );
  }

  Widget _getCurrentScreen() {
    if (_page == 0) {
      if (dishCategory != null) {
        return DishesListPage(
          category: dishCategory!,
        );
      }
      return CategoriesListPage(
        onCategoryPressed: (c) {
          setState(() {
            dishCategory = c;
          });
        },
      );
    } else {
      return const BasketPage();
    }
  }

  void onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }
}
