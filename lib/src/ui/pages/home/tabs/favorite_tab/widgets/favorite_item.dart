import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:deliveryproyect/src/ui/pages/home/home_controller.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/home_tap/widgets/rate_item.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key, required this.dish}) : super(key: key);
  final Dish dish;

  void _deleteItem(BuildContext context) {
    final homeController = Get.i.find<HomeController>();
    homeController.deleteFavorite(dish);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      margin: const EdgeInsets.all(10).copyWith(bottom: 5),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: _deleteItem,
              backgroundColor: Colors.redAccent,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: dish.photo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.name,
                    style: MyFontStyles.title,
                  ),
                  const SizedBox(height: 5),
                  RateItem(item: dish)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
