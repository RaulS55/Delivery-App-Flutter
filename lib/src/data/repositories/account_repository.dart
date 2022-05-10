import 'package:deliveryproyect/src/data/models/user.dart';

abstract class AccountRepository {
  Future<User?> get userInformation;
}
