import 'package:farfor_test_project/views/pages/app_tab_page.dart';
import 'package:farfor_test_project/views/pages/basket_page.dart';
import 'package:farfor_test_project/views/pages/categories_list_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

enum TabsList { main, basket }

class PageManager extends Cubit<PageManagerState> {
  PageManager() : super(PageManagerState.initial());

  GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> mainNavigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> basketNavigationKey = GlobalKey<NavigatorState>();

  static PageManager read(BuildContext context) => context.read<PageManager>();
  static PageManager watch(BuildContext context) => context.watch<PageManager>();

  Page<dynamic> whatIsTheLastPage({bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      return pages.last;
    }

    switch (state.activeTab) {
      case TabsList.main:
        pages = [...state.mainPages];
        return pages.last;
      case TabsList.basket:
        pages = [...state.basketPages];
        return pages.last;
    }
  }

  bool canPop({bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      return pages.length > 1;
    }

    switch (state.activeTab) {
      case TabsList.main:
        pages = [...state.mainPages];
        return pages.length > 1;
      case TabsList.basket:
        pages = [...state.basketPages];
        return pages.length > 1;
    }
  }

  push(Page page, {bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      if (pages.last != page) {
        pages.add(
          page,
        );
        emit(state.copyWith(rootPages: pages));
      }
    } else {
      switch (state.activeTab) {
        case TabsList.main:
          pages = [...state.mainPages];
          if (pages.last != page) {
            pages.add(
              page,
            );
            emit(state.copyWith(mainPages: pages));
          }

          break;
        case TabsList.basket:
          pages = [...state.basketPages];
          if (pages.last != page) {
            pages.add(
              page,
            );
            emit(state.copyWith(basketPages: pages));
          }
          break;
      }
    }
  }

  popToFirstPage({bool? result, bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      do {
        pages.removeLast();
      } while (pages.length > 1);
      emit(state.copyWith(rootPages: pages));
      return;
    }

    switch (state.activeTab) {
      case TabsList.main:
        pages = [...state.mainPages];

        do {
          pages.removeLast();
        } while (pages.length > 1);
        if (pages.isEmpty) return;
        emit(state.copyWith(mainPages: pages));
        return;
      case TabsList.basket:
        pages = [...state.basketPages];
        do {
          pages.removeLast();
        } while (pages.length > 1);
        if (pages.isEmpty) return;
        emit(state.copyWith(basketPages: pages));
        return;
    }
  }

  pop({dynamic? result, bool? rootNavigator}) {
    List<Page<dynamic>> pages;
    if (rootNavigator == true) {
      pages = [...state.rootPages];
      pages.removeLast();
      emit(state.copyWith(rootPages: pages));

      return result;
    }

    switch (state.activeTab) {
      case TabsList.main:
        pages = [...state.mainPages];
        pages.removeLast();
        if (pages.isEmpty) return;
        emit(state.copyWith(mainPages: pages));
        return;
      case TabsList.basket:
        pages = [...state.basketPages];
        pages.removeLast();
        if (pages.isEmpty) return;
        emit(state.copyWith(basketPages: pages));
        return;
    }
  }

  clearStackAndPushPage(Page page, {bool? rootNavigator}) {
    if (rootNavigator == true) {
      emit(state.copyWith(rootPages: [page]));
      return;
    }

    switch (state.activeTab) {
      case TabsList.main:
        emit(state.copyWith(mainPages: [page]));
        return;
      case TabsList.basket:
        emit(state.copyWith(basketPages: [page]));
        return;
    }
  }

  changeTab(TabsList tab) {
    if (tab == state.activeTab) {
      popToFirstPage();
      return;
    }
    emit(state.copyWith(activeTab: tab));
  }
}

class PageManagerState {
  final List<Page<dynamic>> _rootPages;
  final List<Page<dynamic>> _mainPages;
  final List<Page<dynamic>> _basketPages;

  final TabsList activeTab;
  bool get canPopRoot => _rootPages.length > 1;
  List<Page<dynamic>> get rootPages => List.unmodifiable(_rootPages);
  List<Page<dynamic>> get mainPages => List.unmodifiable(_mainPages);
  List<Page<dynamic>> get basketPages => List.unmodifiable(_basketPages);

  PageManagerState({
    required List<Page<dynamic>> rootPages,
    required List<Page<dynamic>> mainPages,
    required List<Page<dynamic>> basketPages,
    this.activeTab = TabsList.main,
  })  : _rootPages = rootPages,
        _mainPages = mainPages,
        _basketPages = basketPages;

  factory PageManagerState.initial() {
    return PageManagerState(rootPages: [
      AppPage.page()
    ], mainPages: [
      CategoriesListPage.page(),
    ], basketPages: [
      BasketPage.page(),
    ]);
  }

  PageManagerState copyWith({
    List<Page<dynamic>>? rootPages,
    List<Page<dynamic>>? mainPages,
    List<Page<dynamic>>? basketPages,
    TabsList? activeTab,
  }) {
    return PageManagerState(
      rootPages: rootPages ?? _rootPages,
      mainPages: mainPages ?? _mainPages,
      basketPages: basketPages ?? _basketPages,
      activeTab: activeTab ?? this.activeTab,
    );
  }
}
