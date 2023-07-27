import 'package:amilingue/Widgets/Navigation/cubit/navigation_cubit.dart';
import 'package:amilingue/dependencies.dart';
import 'package:amilingue/features/authentication/presentation/authentication_page.dart';
import 'package:amilingue/features/authentication/presentation/cubit/Auth/auth_cubit.dart';
import 'package:amilingue/features/course_details/presentation/pages/cubit/course_cubit.dart';
import 'package:amilingue/features/excersices/presentation/cubit/exercise_cubit.dart';
import 'package:amilingue/features/excersices/presentation/pages/study_screen2.dart';
import 'package:amilingue/features/lessons/presentation/pages/cubit/lessons_cubit.dart';
import 'package:amilingue/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:amilingue/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

UsecaseConfig usecaseConfig = UsecaseConfig();
void main() {
  runApp(const MyApp());
  ControllerInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var id;
    return MultiRepositoryProvider(
        providers: buildRepositories(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => AuthenticationCubit(context.read())),
            BlocProvider(create: (context) => NavigationCubit()),
            BlocProvider(
              create: (context) => AppThemeCubit(context.read())..init(),
            ),
            BlocProvider(
              create: (context) =>
                  SettingsSwitchCubit(context.read<AppThemeCubit>().state),
            ),
            BlocProvider(
              create: (context) => SettingsLogoutCubit(),
            ),
            BlocProvider(
                create: (BuildContext context) => CourseCubit(
                    getCourseUseCase: usecaseConfig.getCourseUsecase)
                  ..getCourses()),
            BlocProvider(
                create: (BuildContext context) => LessonCubit(
                    getLessonUseCase: usecaseConfig.getLessonUsecase)),
          BlocProvider(
                create: (BuildContext context) => ExerciseCubit(
                    getExerciseUseCase: usecaseConfig.getExerciseUsecase)..getExcercises()),
          ],
          child: GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Fredoka'),
            home: const AuthenticationView(),
          ),
        ));
  }
}
