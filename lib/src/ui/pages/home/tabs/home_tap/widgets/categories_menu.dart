import 'package:deliveryproyect/src/data/models/category_food.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/home_tap/home_tab_controller.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<HomeTabControler>(context, listen: false);
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(controler.categories.length, (index) {
          final category = controler.categories[index];
          return CategoryButtom(category: category);
        }),
      ),
    );
  }
}

class CategoryButtom extends StatelessWidget {
  const CategoryButtom({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryFood category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 7,
        left: 15,
      ),
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  )
                ]),
            child: Column(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    category.icon,
                    width: 80,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  category.label,
                  style: MyFontStyles.regular.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          onPressed: () {}),
    );
  }
}
