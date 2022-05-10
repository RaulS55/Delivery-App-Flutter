abstract class PreferenceRepository {
  Future<void> setOnboardReady(bool ready);
  bool get onboardReady;
}
