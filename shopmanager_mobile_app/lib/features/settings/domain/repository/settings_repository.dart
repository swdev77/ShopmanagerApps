import 'package:shopmanager_mobile_app/features/settings/domain/entities/settings.dart';

abstract class SettingsRepository {
  Future<void> saveSettings(Settings settings);
  Future<Settings> loadSettings();
}