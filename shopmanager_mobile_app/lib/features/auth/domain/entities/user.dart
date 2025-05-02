class User {
  final int id;
  final int warehouseId;
  final String username;
  final String? firstName;
  final String? lastName;
  final String? token;

  User({
    required this.id,
    required this.warehouseId,
    required this.username,
    this.firstName,
    this.lastName,
    this.token,
  });
}
