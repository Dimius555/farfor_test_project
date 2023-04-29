import 'package:farfor_test_project/configurations/navigation/page_manager.dart';
import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedBasketTextWidget extends StatefulWidget {
  const AnimatedBasketTextWidget({super.key, required this.totalPrice});

  final int totalPrice;

  @override
  _AnimatedBasketTextWidgetState createState() => _AnimatedBasketTextWidgetState();
}

class _AnimatedBasketTextWidgetState extends State<AnimatedBasketTextWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0, end: widget.totalPrice.toDouble()).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final activeTab = context.select((PageManager pageManager) => pageManager.state.activeTab);
    return Center(
      child: TweenAnimationBuilder(
        tween: _animation as Tween<double>,
        builder: (context, value, child) {
          return Text(
            value.toStringAsFixed(0),
            style: theme.caption1.copyWith(
              color: activeTab == TabsList.basket ? theme.bottomNavigationItemSelectedColor : theme.bottomNavigationItemUnselectedColor,
            ),
          );
        },
        duration: const Duration(milliseconds: 400),
      ),
    );
  }
}
