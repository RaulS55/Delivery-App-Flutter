import 'package:deliveryproyect/src/data/models/user.dart';
import 'package:deliveryproyect/src/data/repositories/authentication_repository.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:deliveryproyect/src/ui/global_widgets/custom_form.dart';
import 'package:flutter/material.dart';

class RegisterControler extends ChangeNotifier {
  String _email = "", _lastName = "", _name = "";
  final AuthenticationRepository _repository =
      Get.i.find<AuthenticationRepository>();
  GlobalKey<CustomFormState> formKey = GlobalKey();

  void onEmailChenged(String text) {
    _email = text;
  }

  void onNameChenged(String text) {
    _name = text;
  }

  void onLastNameChenged(String text) {
    _lastName = text;
  }

  Future<bool?> submit() async {
    return _repository.register(User(
      id: "id",
      email: _email,
      name: _name,
      lastName: _lastName,
      birthDay: DateTime(1990, 04, 04),
    ));
  }
}
