import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/routes/routes.dart';
import 'package:deliveryproyect/src/ui/global_controler/cart_controller.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CartButtom extends StatelessWidget {
  const CartButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasItems = context.select<CartController, bool>((_) => _.hasItem);
    if (!hasItems) {
      return Container();
    }
    final cart = context.select<CartController, Map<int, Dish>>((_) => _.cart);
    return Stack(
      children: [
        FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.CART);
          },
          child: SvgPicture.asset(
            "assets/pages/home/cart.svg",
            width: 30,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.redAccent),
            child: Text(
              cart.length.toString(),
              textAlign: TextAlign.center,
              style: MyFontStyles.normal.copyWith(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
