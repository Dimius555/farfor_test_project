import 'package:farfor_test_project/data/remote_data_source/resturant_api.dart';
import 'package:farfor_test_project/service_locator.dart';
import 'package:flutter/material.dart';

class AppTabPage extends StatelessWidget {
  AppTabPage({super.key});

  final RestaurantAPI api = sl();

  @override
  Widget build(BuildContext context) {
    // final theme = AppTheme.read(context);
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                final list = await api.fetchCatalog();
                print(list);
              },
              child: const Text('data'))),
    );
  }
}
