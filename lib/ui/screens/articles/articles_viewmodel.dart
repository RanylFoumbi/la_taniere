// ignore_for_file: prefer_final_fields, non_constant_identifier_names, prefer_is_empty, unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:la_taniere/models/article.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/api_service.dart';

class ArticlesViewModel extends FutureViewModel {
  bool _showHeader = true;
  List<Article> _articleList = [];
  ScrollController listViewScrollController = ScrollController();
  ScrollController articlesListScroolController = ScrollController();
  ScrollController postListScroolController = ScrollController();
  ScrollController productsListScroolController = ScrollController();
  NavigationService navigationService = NavigationService();

  bool get showHeader => _showHeader;
  List<Article> get articleList => _articleList;
  final ApiService _apiService = locator<ApiService>();

  set articleList(List<Article> value) => _articleList = value;
  set showHeader(value) => {
        print({"value": value}),
        _showHeader = value,
        notifyListeners()
      };
  
  @override
  Future futureToRun() async {
   articleList = await _apiService.getArticles();
  }

  @override
  void onError(error) {
    // print(error);
    setBusy(false);
  }
}
