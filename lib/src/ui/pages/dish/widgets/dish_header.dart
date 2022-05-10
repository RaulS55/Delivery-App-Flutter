import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveryproyect/src/ui/pages/dish/dish_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DishHeader extends StatelessWidget {
  const DishHeader({Key? key, required this.controller}) : super(key: key);

  final DishController controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 8,
      child: Hero(
        tag: controller.dish.tag!,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: controller.dish.photo,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.8),
                            Colors.white,
                          ])),
                )),
            Positioned(
                child: SafeArea(
              child: CupertinoButton(
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () => Navigator.pop(context)),
            ))
          ],
        ),
      ),
    );
  }
}
