import 'package:deliveryproyect/src/data/models/user.dart';
import 'package:deliveryproyect/src/data/repositories/account_repository.dart';
import 'package:deliveryproyect/src/data/repositories/authentication_repository.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:flutter/widgets.dart';

class LoginCOntroler extends ChangeNotifier {
  String _email = "", _password = "";
  final _authenticationRepository = Get.i.find<AuthenticationRepository>();
  final _accountRepository = Get.i.find<AccountRepository>();

  void onEmailChange(String text) {
    _email = text;
  }

  void onPasswordChange(String text) {
    _password = text;
  }

  Future<User?> submit() async {
    final token = await _authenticationRepository.login(_email, _password);
    if (token != null) {
      await _authenticationRepository.saveToken(token);
      return _accountRepository.userInformation;
    }
    return null;
  }
}
