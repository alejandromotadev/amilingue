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
  Future<void> createUser(UserEntity user) async =>
      userRemoteDataSource.createUser(user);

}
