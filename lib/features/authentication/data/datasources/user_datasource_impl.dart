import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/data/models/auth_models.dart';
import 'package:dio/dio.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<UserModel?> login(String email, String password) async {
    print("===============Login USER DATASOURCE IMPL==============");

    const api = "http://10.0.2.2:3003/api/v1/login";
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data['data'];
      return UserModel(email: body['email'], password: body["password"]);
    } else {
      return null;
    }
  }
}
