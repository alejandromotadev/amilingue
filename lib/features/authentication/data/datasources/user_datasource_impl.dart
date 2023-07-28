import 'dart:convert';
import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
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
      final body = await response.data;
      await sharedPreferences.setString("user", jsonEncode(body["data"][0]));
      await sharedPreferences.setString("email", jsonEncode(body["data"][2]));
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

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
      final body = await response.data;
      await sharedPreferences.setString("user", jsonEncode(body[0]["name"]));
      await sharedPreferences.setString("email", jsonEncode(body[0]["email"]));
      if (body[1] == true) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint("error UserRemoteDatasourcesImpl ====> $error");
    }
  }

  @override
  Future<void> logout() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("user");
    await sharedPreferences.remove("email");
  }
}
