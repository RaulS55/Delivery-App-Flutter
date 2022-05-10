import 'package:deliveryproyect/src/data/models/dish.dart';

abstract class FoodMenuRepository {
  Future<List<Dish>> getPopularMenu();
}
