import 'package:flutter/foundation.dart';

class MixProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _favoriteMixes = [];

  List<Map<String, dynamic>> get favoriteMixes => _favoriteMixes;

  void addToFavorites(Map<String, dynamic> mix) {
    _favoriteMixes.add(mix);
    notifyListeners();
  }

  void removeFromFavorites(Map<String, dynamic> mix) {
    _favoriteMixes.remove(mix);
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> mix) {
    return _favoriteMixes.contains(mix);
  }
}
