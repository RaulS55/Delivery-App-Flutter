import 'package:deliveryproyect/src/ui/global_controler/cart_controller.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPreview extends StatelessWidget {
  const CheckoutPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasItems = context.select<CartController, bool>((_) => _.hasItem);
    if (!hasItems) {
      return const Center(child: Text("No Elements"));
    }
    final controller = context.watch<CartController>();
    //final price = controller.cart.values.map((e) => e.price).toList();
    //final counter = controller.cart.values.map((e) => e.counter).toList();

    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35))),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Table(
              children: [
                _myTableRow("Subtotal: ",
                    "\$ ${controller.subtotal.toStringAsFixed(2)}"),
                _myTableRow("Delivery:",
                    "\$ ${controller.delivery.toStringAsFixed(2)}"),
                _myTableRow("IVA", "\$ ${controller.iva.toStringAsFixed(2)}"),
                _myTableRow(
                    "TOTAL:", "\$ ${controller.total.toStringAsFixed(2)}"),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                  color: Colors.white,
                  child: Text(
                    "CheckOut: ",
                    style: MyFontStyles.title.copyWith(color: primaryColor),
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }

  TableRow _myTableRow(String label, String value) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
          label,
          style: MyFontStyles.regular.copyWith(
            color: Colors.white,
            fontSize: label == "TOTAL:" ? 20 : 17,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
          value,
          style: MyFontStyles.regular.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: label == "TOTAL:" ? 20 : 17,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    ]);
  }
}
