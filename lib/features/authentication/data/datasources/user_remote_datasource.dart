import 'package:amilingue/features/authentication/domain/entities/user.dart';

abstract class UserRemoteDataSource {
  Future<bool?> login(String email, String password);
  Future<bool?> createUser(String name, String username, String email, String password);
  Future<void> logout();
}
