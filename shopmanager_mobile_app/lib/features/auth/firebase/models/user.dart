import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  final String id;
  final String? email;
  final String? name;
  final String? photo;

  static const empty = UserModel(id: '');

  @override
  List<Object?> get props => [id, email, name, photo];
}
