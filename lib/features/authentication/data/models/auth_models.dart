import 'package:amilingue/features/authentication/domain/entities/user.dart';


class UserModel extends UserEntity {

  final String? name;


  UserModel(  
      {
      this.name,
      })
      : super(
       name: name,
);


}
