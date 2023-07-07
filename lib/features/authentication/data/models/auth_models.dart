import 'package:amilingue/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String email,
    required String password,
    required String name,
    required String user_name,
  }) : super(
            email: email, password: password, name: name, user_name: user_name);
  factory UserModel.fromJson(Map<String, dynamic>json){
    return UserModel(
      email:  json["email"],
      name: json["name"],
      password: json["password"],
      user_name: json["user_name"]
    );
  }
  factory UserModel.fromEntity(UserEntity userEntity){
    return UserModel(email: userEntity.email, password: userEntity.password, name: userEntity.name, user_name: userEntity.user_name);
  }
  Map<String, dynamic>toJson(){
    return{
      "email": email,
      "password": password,
      "name": name,
      "user_name": user_name
    };
  }
}
