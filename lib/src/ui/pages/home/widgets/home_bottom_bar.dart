import 'package:deliveryproyect/src/ui/pages/home/home_controller.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<HomeController>(context, listen: false);
    final int currentPage =
        context.select<HomeController, int>((_) => _.currentPage);

    final menuItems =
        context.select<HomeController, List<BottomBarItem>>((_) => _.menuItems);
    return TabBar(
      controller: controler.tabController,
      tabs: List.generate(menuItems.length, (index) {
        final item = menuItems[index];
        return Tab(
            icon: item.bagetCount > 0
                ? Badge(
                    animationType: BadgeAnimationType.scale,
                    badgeContent: Text(
                      item.bagetCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: SvgPicture.asset(
                      item.icon,
                      width: 30,
                      color: currentPage == index ? primaryColor : Colors.black,
                    ),
                  )
                : SvgPicture.asset(
                    item.icon,
                    width: 30,
                    color: currentPage == index ? primaryColor : Colors.black,
                  ));
      }),
    );
  }
}
