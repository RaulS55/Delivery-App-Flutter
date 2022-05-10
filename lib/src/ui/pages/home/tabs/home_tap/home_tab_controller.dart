import 'package:deliveryproyect/src/data/models/category_food.dart';
import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/data/repositories/food_menu_repository.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:flutter/cupertino.dart';

class HomeTabControler extends ChangeNotifier {
  final FoodMenuRepository _foodMenuRepository =
      Get.i.find<FoodMenuRepository>();
  final List<CategoryFood> categories = [
    CategoryFood(
        icon: "assets/pages/home/home_tab/breakfast.svg", label: "breakfast"),
    CategoryFood(
        icon: "assets/pages/home/home_tab/dessert.svg", label: "dessert"),
    CategoryFood(
        icon: "assets/pages/home/home_tab/dinner.svg", label: "dinner"),
    CategoryFood(icon: "assets/pages/home/home_tab/fries.svg", label: "fries"),
  ];

  List<Dish> _popularMenu = [];
  List<Dish> get popularMenu => _popularMenu;

  void afterFirsLayaut() {
    _init();
  }

  void _init() async {
    _popularMenu = await _foodMenuRepository.getPopularMenu();
    notifyListeners();
  }
}
