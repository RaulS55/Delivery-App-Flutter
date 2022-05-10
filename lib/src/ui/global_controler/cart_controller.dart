import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:flutter/cupertino.dart';

class CartController extends ChangeNotifier {
  Map<int, Dish> _cart = {};
  Map<int, Dish> get cart => _cart;

  bool get hasItem => _cart.isNotEmpty;

  double get subtotal => cart.values
      .map((e) => e.price * e.counter)
      .toList()
      .reduce((v, e) => v + e);

  double get iva => double.parse((subtotal * 0.21).toStringAsFixed(2));
  double get delivery => 2.00;
  double get total => subtotal + delivery + delivery;

  bool isInCart(Dish dish) {
    if (_cart.containsKey(dish.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getDishCounter(Dish dish) {
    if (isInCart(dish)) {
      return _cart[dish.id]!.counter;
    }
    return 0;
  }

  void addToCart(Dish dish, {bool update = true}) {
    Map<int, Dish> copy = Map<int, Dish>.from(_cart);
    //Controlo si ya esta en favoritos

    copy[dish.id] = dish;
    _cart = copy;
    if (update) {
      notifyListeners();
    }
  }

  void deleteFromCart(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_cart);
    //Controlo si ya esta en favoritos
    if (copy.containsKey(dish.id)) {
      copy.remove(dish.id);
      _cart = copy;
      notifyListeners();
    }
  }
}
