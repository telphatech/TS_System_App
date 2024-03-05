import 'package:flutter/material.dart';

class CarouselNotifier extends ChangeNotifier {
  int currentIndex = 0;

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}

class BottomNotifier extends ChangeNotifier {
  int currentIndex = 0;

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}

class ImagePathNotifier extends ChangeNotifier {
  dynamic _imagePath;

  dynamic get imagePath => _imagePath;

  void setImagePath(dynamic path) {
    _imagePath = path;
    notifyListeners();
  }
}

class NavigationModel with ChangeNotifier {
  String _selectedScreen = '/';

  String get selectedScreen => _selectedScreen;

  void setSelectedScreen(String route) {
    _selectedScreen = route;
    notifyListeners();
  }
}
