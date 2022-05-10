import 'package:deliveryproyect/src/ui/pages/register/register_controler.dart';
import 'package:deliveryproyect/src/ui/pages/register/widgets/register_form.dart';
import 'package:deliveryproyect/src/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterControler(),
      builder: (_, __) {
        final _size = MediaQuery.of(_).size;
        final _padding = MediaQuery.of(_).padding;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: _size.height - _padding.bottom - _padding.top),
                  color: Colors.transparent,
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text("Sing Up", style: MyFontStyles.title),
                      const SizedBox(height: 5),
                      Text(
                          "Incluido en Si. Haz clic aquí para comprar el track",
                          style: MyFontStyles.normal),
                      const SizedBox(height: 60),
                      const RegisterForm()
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
