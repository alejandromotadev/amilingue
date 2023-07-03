import 'package:amilingue/features/authentication/domain/entities/user.dart';
import 'package:amilingue/features/authentication/domain/usecases/user_usecase.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState>{
  AuthenticationCubit(this._userUseCase) : super(AuthenticationState.none);
  final UserUseCase _userUseCase;

  Future<UserEntity?>loginCubit(String email, String password)async{
    print("================login cubit===============");
    try{
      final user = await _userUseCase.userRepository.login(email, password);
      emit(AuthenticationState.authenticated);
      return user;
    }catch(e){
      print("error authentication cubit ===> ${e}");
    }

  }
}
