import 'package:flutter/material.dart';

class CommonService extends ChangeNotifier {
  int _selectedMenuItem = 0;
  int get selectedMenuItem => _selectedMenuItem;

  setSelectedMenuItem(int index) {
    _selectedMenuItem = index;
    notifyListeners();
  }
}
