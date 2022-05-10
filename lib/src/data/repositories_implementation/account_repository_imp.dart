import 'package:deliveryproyect/src/data/models/user.dart';
import 'package:deliveryproyect/src/data/providers/remote/account_provider.dart';
import 'package:deliveryproyect/src/data/repositories/account_repository.dart';

class AccountRepositoryImp implements AccountRepository {
  final AccountProvider _provider;

  AccountRepositoryImp(this._provider);
  @override
  Future<User?> get userInformation => _provider.userInformation;
}
