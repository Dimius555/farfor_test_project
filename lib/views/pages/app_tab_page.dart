import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppTabPage extends StatelessWidget {
  const AppTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Scaffold(
        body: Center(
            child: Text(
      'Test',
      style: theme.button1,
    )));
  }
}
