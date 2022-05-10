//SERIA LA API QUE RETORNA DATOS DEL USUARIO
import 'package:deliveryproyect/src/data/models/user.dart';
import 'package:deliveryproyect/src/data/providers/local/authentication_client.dart';

class AccountProvider {
  final AuthenticationClient _authenticationClient;

  AccountProvider(this._authenticationClient);

  Future<User?> get userInformation async {
    final token = _authenticationClient.token;

    if (token == null) {
      throw Exception("token is null");
    }
    await Future.delayed(const Duration(seconds: 1));
    return User(
      id: "132",
      email: "test@test.com",
      name: "test",
      lastName: "lastTest",
      birthDay: DateTime(1993, 02, 02),
    );
  }
}
