import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:deliveryproyect/src/ui/global_controler/notification_controller.dart';
import 'package:deliveryproyect/src/ui/pages/home/home_controller.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/favorite_tab/favorite_tab.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/home_tap/home_tab.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/notification_tab/notification_tab.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/profile_tab/profile_tab.dart';
import 'package:deliveryproyect/src/ui/pages/home/widgets/cart_buttom.dart';
import 'package:deliveryproyect/src/ui/pages/home/widgets/home_bottom_bar.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller =
            HomeController(context.read<NotificationControler>());
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          controller.afterFirstLayaut();
        });
        Get.i.put<HomeController>(controller);
        controller.onDispose = () => Get.i.remuve<HomeController>();

        return controller;
      },
      builder: (_, __) {
        final controller = Provider.of<HomeController>(_, listen: false);
        return Scaffold(
          floatingActionButton: const CartButtom(),
          bottomNavigationBar: const HomeBottomBar(),
          body: SafeArea(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                HomeTab(),
                FavoriteTab(),
                NotificationTab(),
                ProfileTab(),
              ],
            ),
          ),
        );
      },
    );
  }
}
