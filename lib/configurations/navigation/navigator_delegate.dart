import 'package:farfor_test_project/configurations/navigation/page_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatorDelegate extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  NavigatorDelegate({required this.navigatorCubit, this.navigationTab});

  final PageManager navigatorCubit;
  final TabsList? navigationTab;
  bool _preventPop = false;

  void allowPop() {
    _preventPop = false;
  }

  void preventPop() {
    _preventPop = true;
  }

  @override
  Future<bool> popRoute() async {
    switch (navigationTab) {
      case null:
        if (navigatorCubit.state.rootPages.length > 1) {
          if (!_preventPop) {
            navigatorCubit.pop(rootNavigator: true);
          } else {
            notifyListeners();
          }
          return SynchronousFuture<bool>(true);
        }
        return SynchronousFuture<bool>(false);
      case TabsList.main:
        if (navigatorCubit.state.mainPages.length > 1) {
          navigatorCubit.pop();
          return SynchronousFuture<bool>(true);
        }
        return SynchronousFuture<bool>(false);
      case TabsList.basket:
        if (navigatorCubit.state.basketPages.length > 1) {
          navigatorCubit.pop();
          return SynchronousFuture<bool>(true);
        }
        return SynchronousFuture<bool>(false);
    }
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    return SynchronousFuture<void>(null);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey {
    switch (navigationTab) {
      case null:
        return navigatorCubit.rootNavigatorKey;
      case TabsList.main:
        return navigatorCubit.mainNavigationKey;
      case TabsList.basket:
        return navigatorCubit.basketNavigationKey;
    }
  }

  List<Page<dynamic>> definePages(BuildContext context) {
    switch (navigationTab) {
      case null:
        return context.watch<PageManager>().state.rootPages;
      case TabsList.main:
        return context.watch<PageManager>().state.mainPages;
      case TabsList.basket:
        return context.watch<PageManager>().state.basketPages;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: definePages(context),
      onPopPage: (Route<dynamic> route, dynamic result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }
        PageManager.read(context).pop(rootNavigator: true);
        return true;
      },
    );
  }
}
