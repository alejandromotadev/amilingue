import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/domain/entities/user.dart';
import 'package:amilingue/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<bool?> login(String email, String password) async {
    return userRemoteDataSource.login(email, password);
  }

  @override
  Future<bool?> createUser(String name, String username, String email, String password) async =>
      userRemoteDataSource.createUser(name, username, email, password);

  @override
  Future<void> logout() async {
    userRemoteDataSource.logout();
  }

}
