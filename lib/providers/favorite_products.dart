import 'package:flutter/material.dart';

class FavoriteProducts with ChangeNotifier {
  final List<Map<String, dynamic>> favorites = [];

  void addToFavorites(Map<String, dynamic> product) {
    favorites.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Map<String, dynamic> product) {
    favorites.remove(product);
    notifyListeners();
  }
}
