import 'package:deliveryproyect/src/routes/routes.dart';
import 'package:deliveryproyect/src/ui/global_widgets/circle_buttom.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("Or via social media"),
        const SizedBox(height: 10),
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
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text("Dont have a account?"),
            CupertinoButton(
                child: Text(
                  "Sing Up",
                  style: MyFontStyles.regular,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.REGISTER);
                })
          ],
        )
      ],
    );
  }
}
