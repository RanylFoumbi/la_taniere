// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:la_taniere/ui/screens/matchs/match_view.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:stacked/stacked.dart';

import '../home/home_view.dart';

class BigContainerViewModel extends ChangeNotifier {
  List<Widget> _tabList = [
    const HomeView(),
    const MatchView(),
    Container(
      color: YELLOW_COLOR,
    ),
    Container(
      color: RED_COLOR,
    ),
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
