import 'package:amilingue/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  @override
  final String email;
  @override
  final String password;
  @override
  final String name;
  @override
  final String user_name;


  const UserModel({required this.email, required this.password, required this.name, required this.user_name}) : super(email: email, password: password, name: name, user_name: user_name);
}