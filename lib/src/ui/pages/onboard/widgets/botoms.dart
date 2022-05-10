import 'package:deliveryproyect/src/routes/routes.dart';
import 'package:deliveryproyect/src/ui/pages/onboard/onboard_controler.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardBottoms extends StatelessWidget {
  const OnboardBottoms({
    Key? key,
  }) : super(key: key);

  void _onNext(BuildContext context, OnboardControler controler) {
    if (controler.currenPage == 2) {
      Navigator.pushReplacementNamed(context, Routes.WELCOME);
    } else {
      controler.pageController.nextPage(
          duration: const Duration(microseconds: 300), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const _Dots(),
        Consumer<OnboardControler>(
          builder: (_, controler, child) {
            final double page = controler.currenPage!;
            bool isEnd = page == 2.0;

            return CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                isEnd ? "Get Started" : "Next",
                style: MyFontStyles.bottom,
              ),
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
              onPressed: () {
                _onNext(context, controler);
              },
            );
          },
        ),
        CupertinoButton(
          child: const Text(
            "SKIP",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<OnboardControler>(context);
    return DotsIndicator(
      dotsCount: controler.items.length,
      position: controler.currenPage!,
      decorator: const DotsDecorator(
        activeColor: primaryColor,
        size: Size.square(9.0),
        activeSize: Size(18.0, 9.0),
      ),
    );
  }
}
