import 'package:shared_preferences/shared_preferences.dart';

const _key = "Onboard";

class PreferenceProvider {
  final SharedPreferences _preferences;

  PreferenceProvider(this._preferences);

  Future<void> setOnboardReady(bool ready) async {
    await _preferences.setBool(_key, ready);
  }

  bool get onboardReady => _preferences.getBool(_key) ?? false;
}
