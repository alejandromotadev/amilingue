import 'dart:convert';

import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/domain/entities/user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<void> login(String email, String password) async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    const api = "http://10.0.2.2:3003/api/v1/login";
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;
    try{
      response = await dio.post(api, data: data);
      final body = response.data;
      print(body);
      await sharedPreferences.setString("user", jsonEncode(body));
      await sharedPreferences.setString("email", jsonEncode(body));


    }catch(error){
      print("error en funcion login UserRemoteDatasourcesImpl ====> ${error}");
    }
  }

  @override
  Future<void> createUser(UserEntity user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(UserEntity user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserEntity user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
