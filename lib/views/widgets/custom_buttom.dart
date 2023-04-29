import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.svgIcon,
    required this.onPressed,
  });

  final String svgIcon;
  final Function onPressed;

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
      onPressed: () {
        onPressed.call();
      },
      child: SvgPicture.asset(
        svgIcon,
        color: theme.primaryBackgroundColor,
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function onPressed;

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
      onPressed: () {
        onPressed.call();
      },
      child: Text(
        text,
        style: theme.button1.copyWith(color: LightModeColors.primaryBackgroundColor),
      ),
    );
  }
}
