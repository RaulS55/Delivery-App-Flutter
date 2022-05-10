import 'package:deliveryproyect/src/ui/global_widgets/custom_form.dart';
import 'package:deliveryproyect/src/ui/global_widgets/input_text.dart';
import 'package:deliveryproyect/src/ui/global_widgets/round_buttom.dart';
import 'package:deliveryproyect/src/ui/pages/register/register_controler.dart';
import 'package:deliveryproyect/src/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controler = context.read<RegisterControler?>();
    final isFormOk = controler!.formKey.currentState!.validate();

    if (isFormOk) {
      ProgressDialog.show(context);
      final bool isOk = await controler.submit() as bool;
      Navigator.pop(context); //PARA TERMINAR EL CIRCULO
      if (!isOk) {
        Dialogs.alert(
          context,
          title: "ERROR",
          description: "Register Fail",
        );
      } else {
        await Dialogs.alert(
          context,
          title: "GOOD",
          description: "Register OK",
          okText: "Go to Login",
          dismissble: false,
        );
        Navigator.pop(context);
      }
    } else {
      Dialogs.alert(
        context,
        title: "ERROR",
        description: "Invalid Imputs",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controler = context.watch<RegisterControler>();
    return CustomForm(
      key: controler.formKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: Column(
          children: [
            //NOMBRE
            InputText(
              prefixIcon: const Icon(Icons.person_outline),
              onChanged: controler.onNameChenged,
              labelText: "Name",
              validator: (text) {
                return text.trim().length > 2 ? null : "Invalide Name";
              },
            ),
            const SizedBox(height: 15),
            //APELLIDO
            InputText(
              prefixIcon: const Icon(Icons.person_pin_outlined),
              onChanged: controler.onLastNameChenged,
              labelText: "LastName",
              validator: (text) {
                return text.trim().length > 2 ? null : "Invalide Last name";
              },
            ),
            const SizedBox(height: 15),
            //EMAIL
            InputText(
              keyboardType: TextInputType.emailAddress,
              onChanged: controler.onEmailChenged,
              labelText: "Email",
              validator: (text) {
                return text.contains("@") ? null : "Invalide Email";
              },
            ),
            const SizedBox(height: 20),

            //BOTON
            Align(
                alignment: Alignment.centerRight,
                child: RoundButtom(
                    label: "Sing Up",
                    onPressed: () {
                      _submit(context);
                    }))
          ],
        ),
      ),
    );
  }
}
