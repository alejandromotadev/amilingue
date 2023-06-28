
import 'package:amilingue/features/authentication/domain/entities/user.dart';

abstract class UserRepository{
Future<UserEntity> login(String email, String password);
}