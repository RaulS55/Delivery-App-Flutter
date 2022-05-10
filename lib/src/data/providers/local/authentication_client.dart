import 'package:shared_preferences/shared_preferences.dart';

const _key = "token";

class AuthenticationClient {
  final SharedPreferences _preferences;

  AuthenticationClient(this._preferences);

  Future<void> saveToken(String token) async {
    await _preferences.setString(_key, token);
  }

  Future<void> singOut() async {
    await _preferences.remove(_key);
  }

  String? get token {
    return _preferences.getString(_key);
  }
}
