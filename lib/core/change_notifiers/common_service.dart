import 'package:flutter/material.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';

class CommonService extends ChangeNotifier {
  int _selectedMenuItem = 0;
  int get selectedMenuItem => _selectedMenuItem;

  bool isExpandedOrganization = false;

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  void handleTapIsExpandedOrganization(bool isExpanded) {
    isExpandedOrganization = isExpanded;
    notifyListeners();
  }

  setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  setSelectedMenuItem(int index) {
    _selectedMenuItem = index;
    notifyListeners();
  }

  final sharedPreferenceService = serviceLocator<SharedPreferenceService>();
}
