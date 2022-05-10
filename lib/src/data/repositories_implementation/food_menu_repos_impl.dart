import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/data/providers/remote/food_menu_provider.dart';
import 'package:deliveryproyect/src/data/repositories/food_menu_repository.dart';

class FoodMenuRepositorImpl implements FoodMenuRepository {
  final FoodMenuProvider _provider;

  FoodMenuRepositorImpl(this._provider);
  @override
  Future<List<Dish>> getPopularMenu() {
    return _provider.getPopularMenu();
  }
}
