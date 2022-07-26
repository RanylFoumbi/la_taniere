// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:la_taniere/ui/screens/matchs/match_view.dart';
import 'package:la_taniere/utilities/colors.dart';

import '../actuality/actuality_view.dart';
import '../articles/articles_view.dart';
import '../home/home_view.dart';

class BigContainerViewModel extends ChangeNotifier {
  List<Widget> _tabList = [
    const HomeView(),
    const MatchView(),
    const ActualityView(),
    const ArticlesView(),
    Container(
      color: GRAY_COLOR,
    ),
  ];
  bool _loading = false;
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  bool get loading => _loading;
  List<Widget> get tabList => _tabList;
  int get selectedIndex => _selectedIndex;
  PageController get pageController => _pageController;

  set selectedIndex(value) => {_selectedIndex = value, notifyListeners()};
}
