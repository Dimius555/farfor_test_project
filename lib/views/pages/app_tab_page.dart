import 'package:farfor_test_project/configurations/navigation/navigator_delegate.dart';
import 'package:farfor_test_project/configurations/navigation/page_manager.dart';
import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/views/widgets/bottom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  static MaterialPage<dynamic> page() {
    return const MaterialPage(
      child: AppPage(),
      key: ValueKey(routeName),
      name: routeName,
    );
  }

  static const routeName = '/root_app_page';

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late RouterDelegate mainNavigationDelegate;
  late RouterDelegate basketNavigationDelegate;

  @override
  initState() {
    mainNavigationDelegate = NavigatorDelegate(
      navigatorCubit: PageManager.read(context),
      navigationTab: TabsList.main,
    );

    basketNavigationDelegate = NavigatorDelegate(
      navigatorCubit: PageManager.read(context),
      navigationTab: TabsList.basket,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activeTab = context.select((PageManager pageManager) => pageManager.state.activeTab);
    context.select((PageManager pageManager) {
      switch (activeTab) {
        case TabsList.main:
          return pageManager.state.mainPages.last;
        case TabsList.basket:
          return pageManager.state.basketPages.last;
      }
    });

    return Scaffold(
      backgroundColor: AppTheme.read(context).primaryBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                TabView(
                  active: activeTab == TabsList.main,
                  navigatorDelegate: mainNavigationDelegate,
                ),
                TabView(
                  active: activeTab == TabsList.basket,
                  navigatorDelegate: basketNavigationDelegate,
                ),
              ],
            ),
          ),
          Divider(
            color: AppTheme.read(context).secondaryBackgroundColor,
          ),
          BottomTabBar(
            activeTab: activeTab,
          ),
        ],
      ),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({
    Key? key,
    required this.active,
    required this.navigatorDelegate,
  }) : super(key: key);
  final bool active;
  final RouterDelegate navigatorDelegate;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !active,
      child: TickerMode(
        enabled: active,
        child: Router(
          routerDelegate: navigatorDelegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
