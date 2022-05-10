import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:deliveryproyect/src/ui/pages/dish/dish_controller.dart';
import 'package:deliveryproyect/src/ui/pages/home/home_controller.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Selecct extends StatefulWidget {
  Selecct({
    Key? key,
  }) : super(key: key);

  final homeController = Get.i.find<HomeController>();

  @override
  State<Selecct> createState() => _SelecctState();
}

class _SelecctState extends State<Selecct> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DishController>(context, listen: false);
    return CupertinoButton(
        child: Icon(
          controller.isFavorite ? Icons.favorite : Icons.favorite_outline,
          size: 40,
          color: controller.isFavorite ? primaryColor : Colors.grey,
        ),
        onPressed: () {
          if (!controller.isFavorite) {
            const SnackBar snackBar = SnackBar(
              content: Text("Toggle Favorites"),
              duration: Duration(seconds: 2),
              backgroundColor: primaryColor,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

          controller.toggleFavorite();
          widget.homeController.addFavorite(controller.dish);
          setState(() {});
        });
  }
}
