// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ChangeNotifier {
  String _pageName = 'Home Page';
  bool _showHeader = true;
  String get pageName => _pageName;
  int _activePage = 0;
  PageController _pageController = PageController();
  ScrollController listViewScrollController = ScrollController();
  ScrollController homepageScrollController = ScrollController();
  ScrollController tagButtonListScroolController = ScrollController();
  ScrollController matchListScroolController = ScrollController();
  ScrollController postListScroolController = ScrollController();
  ScrollController productListScroolController = ScrollController();
  List<String> _articles = [
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

  List<String> get images => _images;
  bool get showHeader => _showHeader;
  int get activePage => _activePage;
  List<String> get articles => _articles;
  PageController get pageController => _pageController;

  set activePage(value) => {
        print({"value": value}),
        _activePage = value,
        notifyListeners()
      };

  set showHeader(value) => {
        print({"value": value}),
        _showHeader = value,
        notifyListeners()
      };

  @override
  Future futureToRun() async => {};

  @override
  void onError(error) {
    // print(error);
    // setBusy(false);
  }
}
