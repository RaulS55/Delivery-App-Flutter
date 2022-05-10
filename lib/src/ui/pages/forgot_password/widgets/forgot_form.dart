import 'package:deliveryproyect/src/ui/global_widgets/input_text.dart';
import 'package:deliveryproyect/src/ui/global_widgets/round_buttom.dart';
import 'package:deliveryproyect/src/ui/pages/forgot_password/forgot_controler.dart';
import 'package:deliveryproyect/src/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controler = context.read<ForgotPasswordControler>();
    ProgressDialog.show(context);
    final sent = await controler.submit();
    Navigator.pop(context);
    if (sent!) {
      await Dialogs.alert(context,
          dismissble: false,
          title: "GOOD",
          description: "We have sent a Email to ${controler.email}");
      Navigator.pop(context);
    } else {
      Dialogs.alert(context,
          title: "ERROR", description: "Email ${controler.email} not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    final controler = context.watch<ForgotPasswordControler>();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 330),
      child: Column(
        children: [
          const SizedBox(height: 20),
          SvgPicture.asset(
            "assets/pages/forgot_password/forgot_password.svg",
            width: 300,
          ),
          const SizedBox(height: 20),
          InputText(
            labelText: "Email",
            onChanged: controler.onEmailChange,
            validator: (text) => null,
          ),
          const SizedBox(height: 20),
          Align(
              alignment: Alignment.centerRight,
              child: RoundButtom(
                  label: "Send", onPressed: () => _submit(context))),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
