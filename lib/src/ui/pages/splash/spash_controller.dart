import 'package:deliveryproyect/src/data/models/user.dart';
import 'package:deliveryproyect/src/data/repositories/account_repository.dart';
import 'package:deliveryproyect/src/data/repositories/authentication_repository.dart';
import 'package:deliveryproyect/src/data/repositories/preference_repository.dart';
import 'package:deliveryproyect/src/helpers/get.dart';
import 'package:flutter/cupertino.dart';

class SpashController extends ChangeNotifier {
  final _preferenceRepository = Get.i.find<PreferenceRepository>();
  final _autenticationRepository = Get.i.find<AuthenticationRepository>();
  final _accountRepository = Get.i.find<AccountRepository>();

  void Function(User? user, bool isReady)? onAfterFirstLayaut;

  void afterFirstLayaut() async {
    await Future.delayed(const Duration(seconds: 1));
    final token = _autenticationRepository.token;
    if (token != null) {
      final user = await _accountRepository.userInformation;
      if (user != null) {
        if (onAfterFirstLayaut != null) {
          onAfterFirstLayaut!(user, true);
          return;
        }
      }
    }
    final isReady = _preferenceRepository.onboardReady;
    if (onAfterFirstLayaut != null) {
      onAfterFirstLayaut!(null, isReady);
    }
  }
}
