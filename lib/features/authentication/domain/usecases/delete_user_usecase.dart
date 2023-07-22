import 'package:amilingue/features/authentication/domain/entities/user.dart';
import 'package:amilingue/features/authentication/domain/repositories/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository repository;

  DeleteUserUseCase({required this.repository});

  Future<void> call(UserEntity user) {
    return repository.deleteUser(user);
  }
}