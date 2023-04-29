import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.svgIcon,
    this.aspectRatio = 2.4,
  });

  final String svgIcon;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 12.0),
        backgroundColor: theme.appAccentColor,
        textStyle: theme.button1.copyWith(
          color: theme.primaryBackgroundColor,
        ),
      ),
      onPressed: () {},
      child: SvgPicture.asset(
        svgIcon,
        color: theme.primaryBackgroundColor,
      ),
    );
  }
}
