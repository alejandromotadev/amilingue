import 'package:amilingue/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  final String name;
  final String email;
  final String password;


  UserModel({required this.name, required this.email, required this.password}) : super(name: name, email: email, password: password);
}