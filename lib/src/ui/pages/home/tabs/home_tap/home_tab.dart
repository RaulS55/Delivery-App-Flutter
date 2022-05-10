import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/home_tap/home_tab_controller.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/home_tap/widgets/categories_menu.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/home_tap/widgets/horizontal_dishes.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/home_tap/widgets/search_button.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  //PRESERVAR EL ESTADO DEL HOME TAB
  @override
  Widget build(BuildContext context) {
    super.build(context); //PRESERVAR EL ESTADO DEL HOME TAB
    return ChangeNotifierProvider<HomeTabControler>(
      create: (_) {
        final controler = HomeTabControler();
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          controler.afterFirsLayaut();
        });
        return controler;
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Hello Darwin",
                  style: MyFontStyles.regular,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Make your own food, \nStay at home",
                  style: MyFontStyles.title.copyWith(fontSize: 25),
                ),
              ),
              const SizedBox(height: 20),
              const SearchButtom(),
              const SizedBox(height: 20),
              const CategoriesMenu(),
              const SizedBox(height: 20),
              Builder(builder: ((context) {
                final List<Dish> popularMenu = context
                    .select<HomeTabControler, List<Dish>>((_) => _.popularMenu);
                return HorizontalDishes(
                  dishes: popularMenu,
                  title: "Popular Menu",
                  onViewAll: () {},
                );
              })),
              const SizedBox(height: 20),
              Builder(builder: ((context) {
                final List<Dish> popularMenu = context
                    .select<HomeTabControler, List<Dish>>((_) => _.popularMenu);
                return HorizontalDishes(
                  dishes: popularMenu,
                  title: "On Sale",
                  onViewAll: () {},
                );
              }))
            ],
          ),
        ),
      ),
    );
  }

  @override //PRESERVAR EL ESTADO DEL HOME TAB
  bool get wantKeepAlive => true;
}
