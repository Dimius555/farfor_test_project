import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppTheme.read(context).appAccentColor, strokeWidth: 2));
  }
}
