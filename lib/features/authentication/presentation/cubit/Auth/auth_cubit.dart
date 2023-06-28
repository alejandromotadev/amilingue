import 'package:amilingue/features/authentication/domain/usecases/user_usecase.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState>{
  AuthenticationCubit(this._userUseCase) : super(AuthenticationState.none);
  final UserUseCase _userUseCase;

  Future<void>loginCubit(String email, String password)async{
    print("================login cubit===============");
    try{
      await _userUseCase.userRepository.login(email, password);
      emit(AuthenticationState.authenticated);
    }catch(e){
      print(e);
    }

  }
}
