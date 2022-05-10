import 'package:deliveryproyect/src/data/models/dish.dart';
import 'package:deliveryproyect/src/ui/pages/home/tabs/home_tap/widgets/dish_item.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';

class HorizontalDishes extends StatelessWidget {
  const HorizontalDishes({
    Key? key,
    required this.dishes,
    required this.title,
    required this.onViewAll,
  }) : super(key: key);
  final List<Dish> dishes;
  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 220,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  title,
                  style: MyFontStyles.title,
                ),
              ),
              CupertinoButton(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "View All",
                    style: MyFontStyles.regular,
                  ),
                  onPressed: onViewAll)
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((_, index) {
                final item = dishes[index];

                return DishHomeItem(key: UniqueKey(), item: item);
              }),
              itemCount: dishes.length,
            ),
          ),
        ],
      ),
    );
  }
}
