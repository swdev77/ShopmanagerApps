import 'package:shopmanager_mobile_app/core/result.dart';
import 'package:shopmanager_mobile_app/features/settings/data/repository/settings_repository_impl.dart';
import 'package:shopmanager_mobile_app/features/settings/domain/entities/settings.dart';

class SettingsViewModel {
  final repository = SettingsRepositoryImpl();

  String _message = '';

  String? apiBaseUrl;
  String? user;
  String? password;

  SettingsViewModel({
    this.apiBaseUrl,
    this.user,
    this.password,
  });

  SettingsViewModel copyWith({
    String? apiBaseUrl,
    String? user,
    String? password,
  }) {
    return SettingsViewModel(
      apiBaseUrl: apiBaseUrl ?? this.apiBaseUrl,
      user: user ?? this.user,
      password: password ?? this.password,
    );
  }

  bool get isValid {
    return apiBaseUrl != null &&
        apiBaseUrl!.isNotEmpty &&
        user != null &&
        user!.isNotEmpty &&
        password != null &&
        password!.isNotEmpty;
  }

  bool get isNotValid => !isValid;

  String get message {
    if (isNotValid)
    {
      return 'Please full empty fields';
    }
    return _message;
  }

  Settings toSettings() {
    return Settings(
      baseApiUrl: apiBaseUrl ?? '',
      user: user ?? '',
      password: password ?? '',
    );
  }

  factory SettingsViewModel.fromSettings(Settings settings) {
    return SettingsViewModel(
      apiBaseUrl: settings.baseApiUrl,
      user: settings.user,
      password: settings.password,
    );
  }

  Future<Result<void>> save() async {
    try {
      final settings = toSettings();
      await repository.saveSettings(settings);

      _message = 'Settings saved successfully';

      return const Success(null);
    } catch (e) {
      _message = "Error saving settings: $e";
      return Failure(e.toString());
    }
  }

  Future<Result<SettingsViewModel>> load() async {
    final settings = await repository.loadSettings();
    _message = 'Settings loaded successfully';
    return Success(SettingsViewModel.fromSettings(settings));
  }
}
