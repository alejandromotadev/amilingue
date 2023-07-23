import 'package:amilingue/features/authentication/domain/usecases/user_usecase.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._userUseCase) : super(AuthenticationState.none);
  final UserUseCase _userUseCase;

  Future<void> loginCubit(String email, String password) async {
    try {
      final response = await _userUseCase.userRepository.login(email, password);
      if(response == true){
        emit(AuthenticationState.authenticated);

      }else{
        emit(AuthenticationState.none);
      }

    } catch (e) {
      print("error authentication cubit ===> ${e}");
    }
  }
}
