import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopmanager_mobile_app/features/settings/core/setting_constants.dart';
import 'package:shopmanager_mobile_app/features/settings/domain/entities/settings.dart';
import 'package:shopmanager_mobile_app/features/settings/domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  @override
  Future<Settings> loadSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final settings = Settings.empty();
    try {
      final apiBaseUrl = preferences.getString(SettingConstants.apiBaseUrl);
      final user = preferences.getString(SettingConstants.user);
      final password = preferences.getString(SettingConstants.password);

      return Settings(
        baseApiUrl: apiBaseUrl ?? '',
        user: user ?? '',
        password: password ?? '',
      );
    } catch (e) {
      return settings;
    }
  }

  @override
  Future<void> saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    preferences.setString(SettingConstants.apiBaseUrl, settings.baseApiUrl);
    preferences.setString(SettingConstants.user, settings.user);
    preferences.setString(SettingConstants.password, settings.password);
  }
}
