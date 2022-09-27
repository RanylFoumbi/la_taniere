// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/article.dart';
import '../models/product.dart';
import '../ui/components/article_detail.dart';
import '../ui/components/product_detail.dart';
import '../ui/components/vertical_list.dart';
import '../ui/screens/bigContainer/bigContainer_view.dart';
import '../ui/screens/home/home_view.dart';
import '../ui/screens/splash/splash_screen_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String bigContainerView = '/big-container-view';
  static const String homeView = '/home-view';
  static const String verticalListPage = '/vertical-list-page';
  static const String productDetail = '/product-detail';
  static const String articleDetail = '/article-detail';
  static const all = <String>{
    splashScreenView,
    bigContainerView,
    homeView,
    verticalListPage,
    productDetail,
    articleDetail,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.bigContainerView, page: BigContainerView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.verticalListPage, page: VerticalListPage),
    RouteDef(Routes.productDetail, page: ProductDetail),
    RouteDef(Routes.articleDetail, page: ArticleDetail),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreenView: (data) {
      var args = data.getArgs<SplashScreenViewArguments>(
        orElse: () => SplashScreenViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SplashScreenView(key: args.key),
        settings: data,
      );
    },
    BigContainerView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const BigContainerView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    VerticalListPage: (data) {
      var args = data.getArgs<VerticalListPageArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => VerticalListPage(
          key: args.key,
          title: args.title,
          data: args.data,
        ),
        settings: data,
      );
    },
    ProductDetail: (data) {
      var args = data.getArgs<ProductDetailArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ProductDetail(
          key: args.key,
          product: args.product,
        ),
        settings: data,
      );
    },
    ArticleDetail: (data) {
      var args = data.getArgs<ArticleDetailArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ArticleDetail(
          key: args.key,
          article: args.article,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SplashScreenView arguments holder class
class SplashScreenViewArguments {
  final Key? key;
  SplashScreenViewArguments({this.key});
}

/// VerticalListPage arguments holder class
class VerticalListPageArguments {
  final Key? key;
  final String title;
  final StatelessWidget? data;
  VerticalListPageArguments({this.key, required this.title, this.data});
}

/// ProductDetail arguments holder class
class ProductDetailArguments {
  final Key? key;
  final Product product;
  ProductDetailArguments({this.key, required this.product});
}

/// ArticleDetail arguments holder class
class ArticleDetailArguments {
  final Key? key;
  final Article article;
  ArticleDetailArguments({this.key, required this.article});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToSplashScreenView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.splashScreenView,
      arguments: SplashScreenViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToBigContainerView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.bigContainerView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToVerticalListPage({
    Key? key,
    required String title,
    StatelessWidget? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.verticalListPage,
      arguments: VerticalListPageArguments(key: key, title: title, data: data),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProductDetail({
    Key? key,
    required Product product,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.productDetail,
      arguments: ProductDetailArguments(key: key, product: product),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToArticleDetail({
    Key? key,
    required Article article,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.articleDetail,
      arguments: ArticleDetailArguments(key: key, article: article),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
