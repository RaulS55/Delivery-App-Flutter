import 'package:deliveryproyect/src/ui/pages/onboard/onboard_controler.dart';
import 'package:deliveryproyect/src/ui/pages/onboard/widgets/botoms.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OnboardSlider extends StatelessWidget {
  const OnboardSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<OnboardControler>(context, listen: false);
    return PageView(
      controller: controler.pageController,
      children: List.generate(controler.items.length, (index) {
        final item = controler.items[index];
        return Column(
          children: [
            Expanded(
                child: Container(
              color: fondColor,
              child: SvgPicture.asset(item.image),
            )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: grayColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: MyFontStyles.title,
                        ),
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: OnboardBottoms())
                ],
              ),
            ))
          ],
        );
      }),
    );
  }
}
