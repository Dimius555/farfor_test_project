import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key, required this.onCountPressed, required this.count});

  final String count;
  final Function(bool isPlus) onCountPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.notchColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _CounterButton(
            svgIcon: AppIcons.iconMinus,
            onPressed: () {
              onCountPressed.call(false);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              count,
              style: theme.caption1,
            ),
          ),
          _CounterButton(
            svgIcon: AppIcons.iconPlus,
            onPressed: () {
              onCountPressed.call(true);
            },
          ),
        ],
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton({required this.svgIcon, required this.onPressed});

  final String svgIcon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed.call();
      },
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            svgIcon,
            width: 4,
          ),
        ),
      ),
    );
  }
}
