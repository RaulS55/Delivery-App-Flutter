import 'package:deliveryproyect/src/data/repositories/preference_repository.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:deliveryproyect/src/routes/routes.dart';
import 'package:deliveryproyect/src/ui/global_widgets/circle_buttom.dart';
import 'package:deliveryproyect/src/ui/global_widgets/round_buttom.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  Future<void> _setReady() {
    return Get.i.find<PreferenceRepository>().setOnboardReady(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: SvgPicture.asset("assets/pages/welcome/welcome.svg"),
              ),
            ),
            Text(
              "WELCOME",
              style: MyFontStyles.title,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: RoundButtom(
                          label: "Login",
                          onPressed: () async {
                            await _setReady();
                            Navigator.pushReplacementNamed(
                                context, Routes.LOGIN);
                          })),
                  const SizedBox(width: 30),
                  Expanded(
                      child: RoundButtom(
                    label: "Sing Up",
                    onPressed: () async {
                      await _setReady();
                      Navigator.pushNamed(context, Routes.REGISTER);
                    },
                    backgraundColor: Colors.white,
                    border: true,
                    textColor: Colors.black,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text("Or via social media"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButtom(
                  onPressed: () {},
                  iconPath: "facebook",
                  backgraundColor: Colors.blue,
                  iconColor: Colors.white,
                ),
                CircleButtom(
                  onPressed: () {},
                  iconPath: "google",
                  backgraundColor: Colors.red,
                  iconColor: Colors.white,
                ),
                CircleButtom(
                  onPressed: () {},
                  iconPath: "apple",
                  backgraundColor: Colors.grey,
                  iconColor: Colors.white,
                )
              ],
            ),
            const SizedBox(height: 60)
          ],
        ),
      )),
    );
  }
}
