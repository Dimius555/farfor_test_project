import 'package:easy_localization/easy_localization.dart';
import 'package:farfor_test_project/configurations/localization/locale_keys.g.dart';
import 'package:farfor_test_project/configurations/navigation/page_manager.dart';
import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/configurations/theme/theme_notifier.dart';
import 'package:farfor_test_project/service_locator.dart';
import 'package:farfor_test_project/views/blocs/dishes_bloc/dishes_bloc.dart';
import 'package:farfor_test_project/views/blocs/sales_bloc/sales_bloc.dart';
import 'package:farfor_test_project/views/pages/dishes_list_page.dart';
import 'package:farfor_test_project/views/widgets/countdown_widget.dart';
import 'package:farfor_test_project/views/widgets/dish_category_widget.dart';
import 'package:farfor_test_project/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListPage extends StatefulWidget {
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
  State<CategoriesListPage> createState() => _CategoriesListPageState();
}

class _CategoriesListPageState extends State<CategoriesListPage> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final dishState = DishesBloc.watchState(context);
    final isDarkMode = context.watch<ThemeNotifier>().isDarkMode;
    if (dishState.status is OkDishes) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.categories_title.tr(),
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
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            SalesBloc.read(context).add(SetSalesDateTimeEvent());
            DishesBloc.read(context).add(LoadDishes(isReloading: true));
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 150,
                title: BlocBuilder<SalesBloc, SalesState>(
                  builder: (context, state) {
                    if (state.status is LoadingSales) {
                      return const LoadingWidget();
                    } else {
                      return CountdownWidget(
                        targetDateTime: state.dt,
                      );
                    }
                  },
                ),
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
          ),
        ),
      );
    } else {
      return const LoadingWidget();
    }
  }
}
