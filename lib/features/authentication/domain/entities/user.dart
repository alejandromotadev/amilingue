import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String password;
  final String name;
  final String user_name;

  const UserEntity({required this.email, required this.password, required this.name, required this.user_name});

  @override
  List<Object?> get props => [];
}
