import 'package:amilingue/features/authentication/domain/entities/user.dart';

abstract class UserRepository{
  Future<void> login(String email, String password);
  Future<void> createUser(UserEntity user);

}