// ignore_for_file: prefer_final_fields, non_constant_identifier_names, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class ActualityViewModel extends ChangeNotifier {
  bool _showHeader = true;
  List<bool> _selectedDate = [];
  List<int> _prevIndex = [];
  ScrollController listViewScrollController = ScrollController();
  ScrollController postListScroolController = ScrollController();
  NavigationService navigationService = NavigationService();

  bool get showHeader => _showHeader;
  List<bool> get selectedDate => _selectedDate;
  List<int> get prevIndex => _prevIndex;

  set showHeader(value) => {
        print({"value": value}),
        _showHeader = value,
        notifyListeners()
      };

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
