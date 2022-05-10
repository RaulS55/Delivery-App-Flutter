import 'package:deliveryproyect/src/data/models/user.dart';
import 'package:deliveryproyect/src/data/providers/local/authentication_client.dart';
import 'package:deliveryproyect/src/data/providers/remote/authentication_provider.dart';
import 'package:deliveryproyect/src/data/repositories/authentication_repository.dart';

//IMPLEMENTACION DE LA INTERFAS
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationProvider _authenticationProvider;

  AuthenticationRepositoryImpl(
      this._authenticationProvider, this._authenticationClient);

  @override
  Future<String?> login(String email, String password) {
    return _authenticationProvider.login(email, password);
  }

  @override
  Future<bool>? register(User user) {
    return _authenticationProvider.register(user);
  }

  @override
  Future<bool>? sendResetToken(String email) {
    return _authenticationProvider.sentResetToken(email);
  }

  // Para el token
  final AuthenticationClient _authenticationClient;

  @override
  Future<void> saveToken(String token) {
    return _authenticationClient.saveToken(token);
  }

  @override
  String? get token => _authenticationClient.token;

  @override
  Future<void> singOut() {
    return _authenticationClient.singOut();
  }
}
