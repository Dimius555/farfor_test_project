import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _CounterButton(svgIcon: AppIcons.iconMinus),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('3'),
          ),
          _CounterButton(svgIcon: AppIcons.iconPlus),
        ],
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton({required this.svgIcon});

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
