import 'package:amilingue/features/authentication/domain/entities/user.dart';

abstract class UserRemoteDataSource {
  Future<bool?> login(String email, String password);
  Future<void> createUser(UserEntity user);
}
