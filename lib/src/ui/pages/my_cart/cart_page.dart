import 'package:deliveryproyect/src/ui/global_controler/cart_controller.dart';
import 'package:deliveryproyect/src/ui/pages/my_cart/widgets/cart_item.dart';
import 'package:deliveryproyect/src/ui/pages/my_cart/widgets/checkout_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartController>().cart.values.toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("My Cart"),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (_, index) {
                final dish = cart[index];
                return MyCartItem(dish: dish);
              })),
      bottomNavigationBar: const CheckoutPreview(),
    );
  }
}
