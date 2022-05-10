// Aqui se define la estructura del repositorio
//ESTO ES UNA INTERFAS
import 'package:deliveryproyect/src/data/models/user.dart';

abstract class AuthenticationRepository {
  Future<String?> login(String email, String password);
  Future<bool>? register(User user);
  Future<bool?>? sendResetToken(String email);
  Future<void> saveToken(String token);
  String? get token;
  Future<void> singOut();
}
