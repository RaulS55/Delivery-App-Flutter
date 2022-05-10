import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:deliveryproyect/src/ui/pages/dish/dish_controller.dart';
import 'package:deliveryproyect/src/ui/global_widgets/dish_counter.dart';
import 'package:deliveryproyect/src/ui/pages/dish/widgets/dish_header.dart';
import 'package:deliveryproyect/src/ui/pages/dish/widgets/floating_add_cart.dart';
import 'package:deliveryproyect/src/ui/pages/dish/widgets/select_favorite.dart';
import 'package:deliveryproyect/src/ui/pages/home/home_controller.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class DishPage extends StatelessWidget {
  const DishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishController>(
      create: (_) {
        //Recupera el plato seleccionado
        final dish = ModalRoute.of(context)!.settings.arguments as Dish;

        final homeController = Get.i.find<HomeController>();

        final isFavorite = homeController.isFavorite(dish);
        final controller = DishController(dish, isFavorite);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        controller.onDispose = (() {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        });

        return controller;
      },
      child: Scaffold(
        //BOTTOM FLOTANTE
        floatingActionButton: const FloatAddCart(),
        backgroundColor: Colors.white,

        //CUERPO
        body: Builder(builder: (context) {
          final controller =
              Provider.of<DishController>(context, listen: false);

          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DishHeader(controller: controller),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.dish.name,
                                  style: MyFontStyles.title),
                              Text(
                                "\$ ${controller.dish.price.toString()} ",
                                style:
                                    MyFontStyles.regular.copyWith(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Selecct()
                      ],
                    ),
                  ),
                  DishCounter(
                      initialValue: controller.dish.counter,
                      onChanged: controller.onCounterChange),
                  const SizedBox(height: 20),
                  Text(
                    controller.dish.description,
                    textAlign: TextAlign.center,
                    style: MyFontStyles.regular,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
