import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/domain/entities/user.dart';
import 'package:amilingue/features/authentication/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl({required this.userRemoteDataSource});
  @override
  Future<UserEntity> login(email, password) async {
    print("===============Login USERREPOSITORYIMPL==============");
    const api = "http://3.215.246.49/api/v1/users/login";
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data['data'];
      return UserEntity(email: email, password: password);
    } else {
      return UserEntity(email: "", password: '');
    }
  }
}
