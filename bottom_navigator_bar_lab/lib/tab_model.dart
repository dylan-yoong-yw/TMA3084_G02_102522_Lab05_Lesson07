import 'package:flutter/foundation.dart';

/// Holds the selected tab index for the BottomNavigationBar.
class TabModel extends ChangeNotifier {
  // Index of the selected tab. 0 = Home (screen1.dart).
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  /// Selects a tab and tells the listening widgets to rebuild.
  void select(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    notifyListeners();
  }
}
