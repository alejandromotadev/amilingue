import 'package:amilingue/Widgets/Navigation/cubit/navigation_cubit.dart';
import 'package:amilingue/dependencies.dart';
import 'package:amilingue/features/authentication/presentation/authentication_page.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_cubit.dart';
import 'package:amilingue/features/course_details/domain/usescases/create_course_usecases.dart';
import 'package:amilingue/features/course_details/domain/usescases/get_courses_usecase.dart';
import 'package:amilingue/features/course_details/presentation/pages/cubit/course_cubit.dart';
import 'package:amilingue/features/excersices/study_screen1.dart';
import 'package:amilingue/features/excersices/study_screen2.dart';
import 'package:amilingue/features/excersices/study_screen3.dart';
import 'package:amilingue/features/lessons/presentation/pages/cubit/lessons_cubit.dart';
import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
UsecaseConfig usecaseConfig = UsecaseConfig();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: buildRepositories(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthenticationCubit(context.read())),
            BlocProvider(create: (context) => NavigationCubit()),
            BlocProvider(create: (context) => AppThemeCubit(context.read())..init(),),
            BlocProvider(create: (context) => SettingsSwitchCubit(context.read<AppThemeCubit>().state),),
            BlocProvider(create: (context) => SettingsLogoutCubit(),),
            BlocProvider(create: (BuildContext context) =>   CourseCubit( getCourseUseCase: usecaseConfig.getCourseUsecase))
            BlocProvider(create: (BuildContext context) =>   LessonCubit( getLessonUseCase: usecaseConfig.getLessonUsecase))
          ],
          child:  MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(useMaterial3: true),
            home: const AuthenticationView(),

          ),
        ));
  }
}
