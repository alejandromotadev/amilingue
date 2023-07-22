import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/domain/entities/user.dart';
import 'package:amilingue/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<void> login(String email, String password) async {
    return userRemoteDataSource.login(email, password);
  }

  @override
  Future<void> createUser(UserEntity user) async =>
      userRemoteDataSource.createUser(user);
  @override
  Future<void> deleteUser(UserEntity user) async =>
      UserRemoteDataSource.deleteUser(user);

  @override
  Stream<List<UserEntity>> getUser() => UserRemoteDataSource.getUser();

  @override
  Future<void> updateUser(UserEntity user) async =>
      UserRemoteDataSource.updateUser(user);
}
