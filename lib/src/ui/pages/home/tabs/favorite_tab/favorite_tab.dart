import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/ui/pages/home/home_controller.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/favorite_tab/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({Key? key}) : super(key: key);

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final favorites = context
        .select<HomeController, Map<int, Dish>>((_) => _.favorites)
        .values
        .toList();

    return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (_, index) {
          return FavoriteItem(
            dish: favorites[index],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
