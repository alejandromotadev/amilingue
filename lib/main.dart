import 'package:amilingue/Widgets/Navigation/cubit/navigation_cubit.dart';
import 'package:amilingue/dependencies.dart';
import 'package:amilingue/features/authentication/presentation/authentication_page.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_cubit.dart';
import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        //Para inyectar repositorios y casos de uso, ir a dependencies.dart
        providers: buildRepositories(),
        child: MultiBlocProvider(
          providers: [
            //Aqui se inyectan solamente los cubit/blocs
            //ejemplo:
            //BlocProvider(create: (context) => AuthenticationCubit(context.read() #=="el context.read() es para leer PARAMETROS"==#  ))
            BlocProvider(create: (context) => AuthenticationCubit()),
            BlocProvider(create: (context) => NavigationCubit()),
            BlocProvider(create: (context) => AppThemeCubit(context.read())..init(),),
            BlocProvider(create: (context) => SettingsSwitchCubit(context.read<AppThemeCubit>().state),),
            BlocProvider(create: (context) => SettingsLogoutCubit(),),

          ],
          child: BlocBuilder<AppThemeCubit, bool>(builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: state
                  ? ThemeData.dark(useMaterial3: true)
                  : ThemeData.light(useMaterial3: true),
              home: const AuthenticationView(),

            );
          }),
        ));
  }
}
