import 'package:farfor_test_project/configurations/navigation/page_manager.dart';
import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/constants.dart';
import 'package:farfor_test_project/views/blocs/basket_bloc/basket_bloc.dart';
import 'package:farfor_test_project/views/widgets/animated_basket_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({
    Key? key,
    required this.activeTab,
  }) : super(key: key);

  final TabsList activeTab;

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    final theme = AppTheme.read(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.primaryBackgroundColor,
      ),
      child: SizedBox(
        height: bottomPadding + 56,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _TabButton(
              label: 'Еда',
              onTap: () {
                PageManager.read(context).changeTab(TabsList.main);
              },
              active: widget.activeTab == TabsList.main,
              icon: SvgPicture.asset(
                AppIcons.iconMenu,
                width: 24,
                height: 24,
                color: widget.activeTab == TabsList.main ? theme.bottomNavigationItemSelectedColor : theme.bottomNavigationItemUnselectedColor,
              ),
            ),
            _TabButton(
              label: 'Корзина',
              onTap: () {
                PageManager.read(context).changeTab(TabsList.basket);
              },
              active: widget.activeTab == TabsList.basket,
              icon: SvgPicture.asset(
                AppIcons.iconMenu,
                width: 24,
                height: 24,
                color: widget.activeTab == TabsList.basket ? theme.bottomNavigationItemSelectedColor : theme.bottomNavigationItemUnselectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({Key? key, required this.active, required this.icon, required this.onTap, required this.label}) : super(key: key);

  final Widget icon;
  final VoidCallback onTap;
  final bool active;
  final String label;

  @override
  Widget build(BuildContext context) {
    final basketState = BasketBloc.watchState(context);
    final theme = AppTheme.read(context);
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 2,
            ),
            icon,
            const SizedBox(
              height: 4,
            ),
            if ((label == 'Корзина' && basketState.total == 0) || label != 'Корзина')
              Text(label, style: theme.caption1.copyWith(color: active ? theme.bottomNavigationItemSelectedColor : theme.bottomNavigationItemUnselectedColor)),
            if (label == "Корзина" && basketState.total != 0)
            AnimatedBasketTextWidget(totalPrice: basketState.total),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 2,
            ),
          ],
        ),
      ),
    );
  }
}
