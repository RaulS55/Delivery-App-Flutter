import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/routes/routes.dart';
import 'package:deliveryproyect/src/ui/global_controler/cart_controller.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/home_tap/widgets/rate_item.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DishHomeItem extends StatelessWidget {
  const DishHomeItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Dish item;

  void _goToDetail(BuildContext context) {
    final int counter = context.read<CartController>().getDishCounter(item);
    final newItem = item.updateCounter(counter, newTag: key.toString());
    Navigator.pushNamed(context, Routes.DISH, arguments: newItem);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 15 / 10,
      child: CupertinoButton(
          padding: const EdgeInsets.only(left: 15),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Hero(
                  tag: key.toString(),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: item.photo,
                      width: double.infinity,
                      //height: size.height * 0.2,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: -1,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(10).copyWith(top: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.9),
                            Colors.white,
                            Colors.white,
                            Colors.white
                          ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: MyFontStyles.regular
                            .copyWith(color: Colors.black, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$  ${item.price}",
                            style: MyFontStyles.normal
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          RateItem(item: item)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          onPressed: () => _goToDetail(context)),
    );
  }
}
