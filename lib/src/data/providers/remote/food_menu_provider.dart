import 'dart:convert';
import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:flutter/services.dart';

class FoodMenuProvider {
  Future<List<Dish>> getPopularMenu() async {
    final jsonAsString = await rootBundle //Para leer JSON
        .loadString("assets/pages/home/home_tab/json/popular_menu.json");
    final List list = jsonDecode(jsonAsString);
    final List<Dish> dishes = [];
    for (final Map<String, dynamic> item in list) {
      final dish = Dish(
        id: item["id"],
        name: item["name"],
        photo: item["preview"],
        description: item["des"],
        price: double.parse(item["price"].toString()),
        rate:
            double.parse(item["rate"] != null ? item["rate"].toString() : "0"),
      );

      dishes.add(dish);
    }
    return dishes;
  }
}
