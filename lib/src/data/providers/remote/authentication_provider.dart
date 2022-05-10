import 'package:deliveryproyect/src/data/models/user.dart';

class AuthenticationProvider {
  Future<String?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == "test@test.com" && password == "123") {
      //simula el token que devolveria la Api
      final token = DateTime.now().microsecondsSinceEpoch.toString();
      return token;
    } else {
      return null;
    }
  }

  Future<bool> register(User user) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> sentResetToken(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
