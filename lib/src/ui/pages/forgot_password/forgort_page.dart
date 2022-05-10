import 'package:deliveryproyect/src/ui/pages/forgot_password/forgot_controler.dart';
import 'package:deliveryproyect/src/ui/pages/forgot_password/widgets/forgot_form.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordControler>(
      create: (_) => ForgotPasswordControler(),
      builder: (_, __) {
        final _size = MediaQuery.of(_).size;
        final _padding = MediaQuery.of(_).padding;
        final appBar = AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
        return Scaffold(
          appBar: appBar,
          body: SafeArea(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  color: Colors.transparent,
                  height: _size.height -
                      _padding.bottom -
                      _padding.top -
                      appBar.preferredSize.height,
                  width: double.infinity,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text("Forgot Password", style: MyFontStyles.title),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Incluido en Si. Haz clic aquí para comprar el track asdasdaddasd",
                          style: MyFontStyles.normal,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const ForgotPasswordForm()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
