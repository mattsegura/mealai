import 'package:flutter/foundation.dart';

class FoodItemsModel extends ChangeNotifier {
  List<String> _foodItems = [];

  List<String> get foodItems => _foodItems;

  void addFoodItem(String item) {
    _foodItems.add(item);
    notifyListeners();
  }

  void removeFoodItem(int index) {
    _foodItems.removeAt(index);
    notifyListeners();
  }
}
