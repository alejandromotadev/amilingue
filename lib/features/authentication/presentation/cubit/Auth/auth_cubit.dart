import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState>{
  AuthenticationCubit() : super(AuthenticationState.none);
}