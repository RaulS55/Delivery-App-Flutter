import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';

class RateItem extends StatelessWidget {
  const RateItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Dish item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(width: 3),
          Text(
            item.rate.toString(),
            style: MyFontStyles.normal.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
