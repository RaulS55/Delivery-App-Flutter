import 'package:deliveryproyect/src/data/models/user.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:deliveryproyect/src/routes/routes.dart';
import 'package:deliveryproyect/src/ui/pages/splash/spash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpashPage extends StatelessWidget {
  const SpashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SpashController>(
      lazy: false,
      create: ((_) {
        final controller = SpashController();
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          controller.afterFirstLayaut();
        });
        controller.onAfterFirstLayaut = (user, isReady) {
          String routeName = isReady ? Routes.LOGIN : Routes.ONBOARD;
          if (user != null) {
            routeName = Routes.HOME;
            Get.i.put<User>(user);
          }

          Navigator.pushReplacementNamed(context, routeName);
        };
        return controller;
      }),
      builder: (_, __) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
