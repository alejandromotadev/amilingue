import 'package:amilingue/features/authentication/data/datasources/user_datasource_impl.dart';
import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/data/repository/user_repository_impl.dart';
import 'package:amilingue/features/authentication/domain/repositories/user_repository.dart';
import 'package:amilingue/features/authentication/domain/usecases/user_usecase.dart';
import 'package:amilingue/features/course_details/data/datasources/course_remote_datasource.dart';
import 'package:amilingue/features/course_details/data/repository/course_repositiry_impl.dart';
import 'package:amilingue/features/course_details/domain/repository/course_repository.dart';
import 'package:amilingue/features/course_details/domain/usescases/create_course_usecases.dart';
import 'package:amilingue/features/course_details/domain/usescases/delete_course_usecases.dart';
import 'package:amilingue/features/course_details/domain/usescases/get_courses_usecase.dart';
import 'package:amilingue/features/course_details/domain/usescases/update_courses_usecase.dart';
import 'package:amilingue/features/excersices/data/datasources/exercise_remote_datasource.dart';
import 'package:amilingue/features/excersices/data/datasources/exercise_remote_datasource_impl.dart';
import 'package:amilingue/features/excersices/data/repository/exercise_repositiry_impl.dart';
import 'package:amilingue/features/excersices/domain/repository/exercise_repository.dart';
import 'package:amilingue/features/excersices/domain/usescases/get_exercise_usecase.dart';
import 'package:amilingue/features/lessons/data/datasources/lesson_remote_datasource.dart';
import 'package:amilingue/features/lessons/data/datasources/lesson_remote_datasource_impl.dart';
import 'package:amilingue/features/lessons/data/repository/lesson_repositiry_impl.dart';
import 'package:amilingue/features/lessons/domain/repository/lessons_repository.dart';
import 'package:amilingue/features/lessons/domain/usescases/create_lesson_usecases.dart';
import 'package:amilingue/features/lessons/domain/usescases/delete_lesson_usecases.dart';
import 'package:amilingue/features/lessons/domain/usescases/get_lesson_usecase.dart';
import 'package:amilingue/features/lessons/domain/usescases/update_lesson_usecase.dart';
import 'package:amilingue/features/profile/data/datasources/profile_datasources.dart';
import 'package:amilingue/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:amilingue/features/profile/data/repository/persistent_storage_repository_impl.dart';
import 'package:amilingue/features/profile/domain/repository/repositories.dart';
import 'package:amilingue/utils/network_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'features/course_details/data/datasources/cousese_remote_datasource_impl.dart';

List<RepositoryProvider> buildRepositories(){
  // RemotesDataSources
  final UserRemoteDataSource userRemoteDataSourceImpl = UserRemoteDataSourceImpl();
  final CourseRemoteDataSource courseRemoteDataSourceImpl = CourseRemoteDataSourceImpl();
  final ExerciseRemoteDataSource exerciseRemoteDataSourceImpl = ExerciseRemoteDataSourceImpl();
  final PersistentStorageRemoteDataSource persistentStorageRemoteDataSourceImpl = PersistentStorageDataSourcesImpl();
  //RemotesDataSourcesImpl
  final LessonRemoteDataSource lessonRemoteDataSource = LessonRemoteDataSourceImpl();
  final CourseRemoteDataSource courseRemoteDataSource = CourseRemoteDataSourceImpl();
  final ExerciseRemoteDataSource exerciseRemoteDataSource = ExerciseRemoteDataSourceImpl();
  //Repositorys
  final LessonRepository lessonRepository = LessonRepositoryImpl(lessonRemoteDataSource: lessonRemoteDataSource);
  final CourseRepository courseRepository = CourseRepositoryImpl(courseRemoteDataSource: courseRemoteDataSource);
  final ExerciseRepository exerciseRepository = ExerciseRepositoryImpl(exerciseRemoteDataSource: exerciseRemoteDataSource);
  return[
    //Repositorys providers
    RepositoryProvider<UserRemoteDataSource>(create: (context)=> UserRemoteDataSourceImpl()),
    RepositoryProvider<UserRepository>(create: (context) => UserRepositoryImpl(userRemoteDataSource: userRemoteDataSourceImpl)),

    RepositoryProvider<PersistentStorageRemoteDataSource>(create:(context)=>PersistentStorageDataSourcesImpl()),
    RepositoryProvider<PersistentStorageRepository>(create: (context)=> PersistentStorageRepositoryImpl(persistentStorageRemoteDataSource: persistentStorageRemoteDataSourceImpl)),

    RepositoryProvider<CourseRemoteDataSource>(create: (context)=> CourseRemoteDataSourceImpl()),
    RepositoryProvider<CourseRepository>(create: (context) =>CourseRepositoryImpl(courseRemoteDataSource: courseRemoteDataSourceImpl)),

    RepositoryProvider<LessonRemoteDataSource>(create: (context)=> LessonRemoteDataSourceImpl()),
    RepositoryProvider<LessonRepository>(create: (context) =>LessonRepositoryImpl(lessonRemoteDataSource: lessonRemoteDataSource)),

    RepositoryProvider<ExerciseRemoteDataSource>(create: (context)=> ExerciseRemoteDataSourceImpl()),
    RepositoryProvider<ExerciseRepository>(create: (context) =>ExerciseRepositoryImpl(exerciseRemoteDataSource: exerciseRemoteDataSourceImpl)),



    //Use cases
    RepositoryProvider<UserUseCase>(create: (context) => UserUseCase(context.read())),
    RepositoryProvider<GetLessonUseCase>(create: (context) => GetLessonUseCase(repository: lessonRepository)),
    RepositoryProvider<DeleteLessonUseCase>(create: (context) => DeleteLessonUseCase(repository: lessonRepository)),
    RepositoryProvider<UpdateLessonUseCase>(create: (context) => UpdateLessonUseCase(repository: lessonRepository)),
    RepositoryProvider<CreateLessonUseCase>(create: (context) => CreateLessonUseCase(repository: lessonRepository)),
    RepositoryProvider<GetCourseUseCase>(create: (context) => GetCourseUseCase(repository: courseRepository)),
    RepositoryProvider<DeleteCourseUseCase>(create: (context) => DeleteCourseUseCase(repository: courseRepository)),
    RepositoryProvider<UpdateCourseUseCase>(create: (context) => UpdateCourseUseCase(repository: courseRepository)),
    RepositoryProvider<CreateCourseUseCase>(create: (context) => CreateCourseUseCase(repository: courseRepository)),
    RepositoryProvider<GetExerciseUseCase>(create: (context) => GetExerciseUseCase(repository: exerciseRepository)),
  ];
}

class ControllerInjection{
  static void init(){
    Get.put<NetworkController>(NetworkController(),permanent: true);
  }
}
