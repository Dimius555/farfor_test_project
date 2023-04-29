import 'package:farfor_test_project/views/pages/app_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.home,
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: AppTabPage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
    ],
  );
}
