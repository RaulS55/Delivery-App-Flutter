import 'package:deliveryproyect/src/data/providers/local/preference_provider.dart';
import 'package:deliveryproyect/src/data/repositories/preference_repository.dart';

class PreferenceRepositoryImp implements PreferenceRepository {
  final PreferenceProvider _provider;

  PreferenceRepositoryImp(this._provider);

  @override
  bool get onboardReady => _provider.onboardReady;

  @override
  Future<void> setOnboardReady(bool ready) {
    return _provider.setOnboardReady(ready);
  }
}
