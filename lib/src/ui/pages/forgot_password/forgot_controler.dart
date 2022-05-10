import 'package:deliveryproyect/src/data/repositories/authentication_repository.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordControler extends ChangeNotifier {
  String _email = "";

  final AuthenticationRepository _repository =
      Get.i.find<AuthenticationRepository>();

  void onEmailChange(String text) {
    _email = text;
  }

  String get email => _email;

  Future<bool?>? submit() {
    return _repository.sendResetToken(_email);
  }
}
