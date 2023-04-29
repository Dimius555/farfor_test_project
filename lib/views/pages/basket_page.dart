import 'package:easy_localization/easy_localization.dart';
import 'package:farfor_test_project/configurations/localization/locale_keys.g.dart';
import 'package:farfor_test_project/configurations/navigation/page_manager.dart';
import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/views/blocs/basket_bloc/basket_bloc.dart';
import 'package:farfor_test_project/views/widgets/basket_dish_widget.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  static MaterialPage<dynamic> page() {
    return const MaterialPage(
      child: BasketPage(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/basket';

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final basketState = BasketBloc.watchState(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.basket_title.tr(),
          style: AppTheme.read(context).headline1,
        ),
        leading: BackButton(
          onPressed: () => PageManager.read(context).changeTab(TabsList.main),
        ),
      ),
      body: basketState.dishes.isEmpty
          ? Center(
              child: Text(
                LocaleKeys.empty_basket_message.tr(),
                textAlign: TextAlign.center,
                style: theme.headline3,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 5.0),
              child: ListView.builder(
                itemCount: basketState.dishes.length,
                itemBuilder: (context, index) {
                  return BasketDishWidget(
                    basketDish: basketState.dishes[index],
                  );
                },
              ),
            ),
    );
  }
}
