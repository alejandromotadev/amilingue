

import 'package:amilingue/features/authentication/data/models/auth_models.dart';

abstract class UserRemoteDataSource {
  Future<UserModel?> login(String email, String password) async {}
}
