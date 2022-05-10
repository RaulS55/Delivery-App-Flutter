import 'package:deliveryproyect/src/ui/global_controler/cart_controller.dart';
import 'package:deliveryproyect/src/ui/pages/dish/dish_controller.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatAddCart extends StatelessWidget {
  const FloatAddCart({Key? key}) : super(key: key);

  void _addToCart(BuildContext context, bool isInCart) {
    final CartController cartController = context.read<CartController>();
    final controller = context.read<DishController>();
    cartController.addToCart(controller.dish);

    //SNACKBAR
    SnackBar snackBar = SnackBar(
      content: Text(
        isInCart ? "Updated car" : "Add to Cart",
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: primaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final DishController dishController =
        Provider.of<DishController>(context, listen: false);
    final bool isInCart = context
        .select<CartController, bool>((_) => _.isInCart(dishController.dish));
    return CupertinoButton(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_grocery_store,
            color: Colors.white,
            size: 30,
          ),
          Text(
            isInCart ? "Updated car" : "Add to Cart",
            style: MyFontStyles.regular.copyWith(color: Colors.white),
          )
        ],
      ),
      onPressed: () => _addToCart(context, isInCart),
      color: primaryColor,
      padding: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(40),
    );
  }
}
