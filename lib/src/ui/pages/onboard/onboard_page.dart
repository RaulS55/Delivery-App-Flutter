import 'package:deliveryproyect/src/ui/pages/onboard/onboard_controler.dart';
import 'package:deliveryproyect/src/ui/pages/onboard/widgets/slider.dart';
import 'package:deliveryproyect/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardControler>(
      create: (_) {
        final controler = OnboardControler();
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          controler.afterFirstLayaut();
        });
        return controler;
      },
      builder: (context, __) => Scaffold(
        body: SafeArea(
            child: Container(
          width: double.infinity,
          color: fondColor,
          child: const OnboardSlider(),
        )),
      ),
    );
  }
}
