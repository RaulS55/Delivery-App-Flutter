import 'package:deliveryproyect/src/ui/pages/login/login_controller.dart';
import 'package:deliveryproyect/src/ui/pages/login/widgets/login_form.dart';
import 'package:deliveryproyect/src/ui/pages/login/widgets/social_login.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginCOntroler(),
      builder: (_, __) {
        final _size = MediaQuery.of(_).size;
        final _padding = MediaQuery.of(_).padding;
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                height: _size.height - _padding.bottom - _padding.top,
                color: Colors.transparent,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text("welcome back!", style: MyFontStyles.title),
                    Expanded(
                        child: SvgPicture.asset(
                            "assets/pages/welcome/welcome.svg")),
                    //ENTRADAS DE TEXTO
                    const LoginForm(),

                    const SocialLogin()
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}
