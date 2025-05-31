class AuthUser {
  final String uid;
  final String email;

  AuthUser({required this.uid, required this.email});

  Map<String, dynamic> toMap() => {
      'uid': uid,
      'email': email,
    };

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
    );
  }
}