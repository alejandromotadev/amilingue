import 'dart:convert';

import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/domain/entities/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<bool?> login(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    const api = "https://user.stevenpadilla.dev/api/v1/users/login";
    final data = {"id_name": email, "password": password};
    final dio = Dio();
    Response response;
    try {
      response = await dio.post(api, data: data);
      final body = response.data;
      await sharedPreferences.setString("user", jsonEncode(body));
      await sharedPreferences.setString("email", jsonEncode(body));
      if (body["login"] == true) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint("error UserRemoteDatasourcesImpl ====> $error");
    }
  }

  @override
  Future<bool?> createUser(String name, String username, String email, String password) async {
    const api =
        "https://user.stevenpadilla.dev/api/v1/users/";
    final data = {
      "name": name,
      "id_name": username,
      "email": email,
      "password": password,
      "premium": false
    };
    final dio = Dio();
    Response response;
    try {
      response = await dio.post(api, data: data);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint("error UserRemoteDatasourcesImpl ====> $error");
    }
  }
}
