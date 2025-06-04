class Settings {
  final String baseApiUrl;
  final String user;
  final String password;

  Settings({
    required this.baseApiUrl,
    required this.user,
    required this.password,
  });

  factory Settings.empty() => Settings(baseApiUrl: '', user: '', password: '');

  Settings copyWith({
    String? baseApiUrl,
    String? user,
    String? password,
  }) {
    return Settings(
      baseApiUrl: baseApiUrl ?? this.baseApiUrl,
      user: user ?? this.user,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'Settings(baseApiUrl: $baseApiUrl, user: $user, password: $password)';
  }
}