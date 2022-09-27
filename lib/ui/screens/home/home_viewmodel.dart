// ignore_for_file: prefer_final_fields, unused_field, unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:la_taniere/models/article.dart';
import 'package:la_taniere/models/product.dart';
import 'package:la_taniere/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  String _pageName = 'Home Page';
  bool _showHeader = true;
  int _activePage = 0;
  List<Article> _postList = [];
  List<Product> _productList = [
    // Product(
    //     name: 'Chaussettes',
    //     description: 'Les sportifs se préparent pour les prochaines rencontres',
    //     price: 25000,
    //     image: '/media/1.png',
    //     status: 'nouveau',
    //     reduction: 20,
    //     created_at: '2022-08-27T11:22:01.890810Z',
    //     updated_at: '2022-08-27T11:22:01.890810Z',
    //     category: ProductCategory(
    //         label: 'lll',
    //         image: '',
    //         description: 'dfsdgfhsdfdfdhfggdfgg',
    //         created_at: '2022-08-27T10:30:27.377222Z',
    //         updated_at: '2022-08-27T10:30:27.377222Z'))
  ];
  String get pageName => _pageName;
  int get activePage => _activePage;
  List<String> get images => _images;
  bool get showHeader => _showHeader;
  List<String> get keywords => _keywords;
  List<Article> get postList => _postList;
  List<Product> get productList => _productList;
  PageController get pageController => _pageController;
  final ApiService _apiService = locator<ApiService>();

  set showHeader(value) => _showHeader = value;
  set activePage(value) => {_activePage = value, notifyListeners()};
  set postList(List<Article> value) => _postList = value;
  set productList(List<Product> value) => _productList = value;
  PageController _pageController = PageController();
  ScrollController listViewScrollController = ScrollController();
  ScrollController homepageScrollController = ScrollController();
  ScrollController tagButtonListScroolController = ScrollController();
  ScrollController matchListScroolController = ScrollController();
  ScrollController postListScroolController = ScrollController();
  ScrollController productListScroolController = ScrollController();
  NavigationService navigationService = NavigationService();
  List<String> _keywords = [
    'FIFA',
    'FECAFOOT',
    'Coupe du monde',
    'Basket',
    'Handball',
    "Coupe d'Afrique"
  ];
  List<String> _images = [
    "assets/images/team.png",
    "assets/images/lion_team.jpeg",
    "assets/images/team.png",
    "assets/images/lion_team.jpeg"
  ];

  // void fetchProducts() async {
  //   products = await _apiService.getProducts();
  //   print({"products": products});
  // }

  @override
  void onError(error) {
    // print(error);
    setBusy(false);
  }

  Future onInit() async {
    productList = await _apiService.getProducts();
    postList = await _apiService.getPostAndTweets();
    notifyListeners();
  }
}
