import 'package:amilingue/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  final String email;
  final String password;


  UserModel({required this.email, required this.password}) : super(email: email, password: password);
}