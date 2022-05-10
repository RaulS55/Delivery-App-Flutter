import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:flutter/cupertino.dart';

class DishController extends ChangeNotifier {
  Dish dish;

  DishController(this.dish, this._isFavorite);
  VoidCallback? onDispose;

  bool _isFavorite;
  bool get isFavorite => _isFavorite;

  void onCounterChange(int counter) {
    dish = dish.updateCounter(counter);
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  @override
  void dispose() {
    if (onDispose != null) {
      onDispose!();
    }
    super.dispose();
  }
}
