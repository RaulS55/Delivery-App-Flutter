import 'package:deliveryproyect/src/data/models/user.dart';
import 'package:deliveryproyect/src/helpers/get.dart';

import 'package:deliveryproyect/src/routes/routes.dart';
import 'package:deliveryproyect/src/ui/global_widgets/input_text.dart';
import 'package:deliveryproyect/src/ui/global_widgets/round_buttom.dart';
import 'package:deliveryproyect/src/ui/pages/login/login_controller.dart';
import 'package:deliveryproyect/src/utils/dialogs.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  void _submit(BuildContext context) async {
    final controler = context.read<LoginCOntroler?>();
    ProgressDialog.show(context);
    final User? user = await controler?.submit();
    Navigator.pop(context); //PARA TERMINAR EL CIRCULO
    if (user == null) {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text("Invalide User"),
                content: Text("Invalide Email or password"),
              ));
    } else {
      //Go to Home
      Get.i.put<User>(user); //Inyecto el usuario
      Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controler = Provider.of<LoginCOntroler?>(context, listen: false);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 350),
      child: Column(
        children: [
          //ENTRADA DE EMAIL
          InputText(
            validator: (text) {
              if (text.contains("@")) {
                return null;
              } else {
                return "Invalide Email";
              }
            },
            onChanged: controler!.onEmailChange,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            labelText: "Email",
          ),
          const SizedBox(height: 20),

          //ENTRADA DE PASSWORD
          InputText(
            validator: (text) => null,
            prefixIcon: const Icon(Icons.lock_outlined),
            obscureText: true,
            onChanged: controler.onPasswordChange,
            onSubmitted: (text) => _submit(context),
            labelText: "Password",
          ),

          //BOTON OLVIDO CONTRASEÑA
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
                child: Text(
                  "Forgot Password",
                  style: MyFontStyles.regular,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.FORGOTPASSWORD);
                }),
          ),
          const SizedBox(height: 20),

          //BOTON LOGIN
          RoundButtom(
            label: "Login",
            onPressed: () => _submit(context),
            padding: const EdgeInsets.symmetric(horizontal: 50),
          ),
        ],
      ),
    );
  }
}
