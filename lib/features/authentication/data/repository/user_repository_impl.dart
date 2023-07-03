import 'dart:convert';

import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/data/models/auth_models.dart';
import 'package:amilingue/features/authentication/domain/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<UserModel> login(email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    print("===============Login USERREPOSITORYIMPL==============");
    //const api = "http://3.215.246.49/api/v1/users/login";
    const api = "http://192.168.209.154:1709/api/v1/users/login";
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data['data'];
      print(body);
      await sharedPreferences.setString("user", jsonEncode(body));
      return UserModel(email: email, password: password, name: body["name"], user_name: body["id_name"]);
    } else {
      return UserModel(name: "",email: "", password: '', user_name: '');
    }
  }

}
