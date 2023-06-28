import 'package:amilingue/features/authentication/domain/repositories/user_repository.dart';


class UserUseCase{
  final UserRepository userRepository;
  UserUseCase(this.userRepository,);
}
