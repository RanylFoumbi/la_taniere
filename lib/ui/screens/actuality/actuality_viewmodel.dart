// ignore_for_file: prefer_final_fields, non_constant_identifier_names, prefer_is_empty, unused_field

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/article.dart';

class ActualityViewModel extends BaseViewModel {
  bool _showHeader = true;
  List<bool> _selectedDate = [];
  List<int> _prevIndex = [];
  List<Article> _postList = [];
  ScrollController listViewScrollController = ScrollController();
  ScrollController postListScroolController = ScrollController();
  NavigationService navigationService = NavigationService();


  bool get showHeader => _showHeader;
  List<int> get prevIndex => _prevIndex;
  List<Article> get postList => _postList;
  List<bool> get selectedDate => _selectedDate;

  set showHeader(value) => {
        print({"value": value}),
        _showHeader = value,
        notifyListeners()
      };
  
  set postList(List<Article> value) => _postList = value;

  void setCalendarButtonState(int index) {
    if (prevIndex.length != 0) {
      print(prevIndex.last);

      selectedDate[prevIndex.last] = false;
      selectedDate[index] = true;
      prevIndex.add(index);
      notifyListeners();
    } else {
      selectedDate[index] = !selectedDate[index];
      prevIndex.add(index);
      notifyListeners();
    }

    print({"selectedDate": selectedDate});
  }
}
