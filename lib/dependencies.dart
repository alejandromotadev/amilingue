import 'package:amilingue/features/authentication/data/datasources/user_datasource_impl.dart';
import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/data/repository/user_repository_impl.dart';
import 'package:amilingue/features/authentication/domain/repositories/user_repository.dart';
import 'package:amilingue/features/authentication/domain/usecases/user_usecase.dart';
import 'package:amilingue/features/exercises/data/datasources/excersice_datasource_impl.dart';
import 'package:amilingue/features/exercises/data/datasources/excersice_remote_datasource.dart';
import 'package:amilingue/features/exercises/data/repository/excersice_repository_impl.dart';
import 'package:amilingue/features/exercises/domain/repositories/excersice_repository.dart';
import 'package:amilingue/features/exercises/domain/usecases/excersice_usecase.dart';
import 'package:amilingue/features/lessons/data/datasources/lesson_datasource_impl.dart';
import 'package:amilingue/features/lessons/data/datasources/lesson_remote_datasource.dart';
import 'package:amilingue/features/lessons/data/repository/lesson_repository_impl.dart';
import 'package:amilingue/features/lessons/domain/repositories/lesson_repository.dart';
import 'package:amilingue/features/lessons/domain/usecases/lesson_usecase.dart';
import 'package:amilingue/features/profile/data/datasources.dart';
import 'package:amilingue/features/profile/domain/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider> buildRepositories(){
  final UserRemoteDataSource userRemoteDataSourceImpl = UserRemoteDataSourceImpl();
  final ExcersiceRemoteDataSource excersiceRemoteDataSource = ExcersiceRemoteDataSourceImpl();
  final LessonRemoteDataSource lessonRemoteDataSource = LessonRemoteDataSourceImpl();

  return[
    RepositoryProvider<UserRemoteDataSource>(create: (context)=> UserRemoteDataSourceImpl()),
    RepositoryProvider<UserRepository>(create: (context) => UserRepositoryImpl(userRemoteDataSource: userRemoteDataSourceImpl )),

    RepositoryProvider<LessonRepository>(create: (context) => LessonRepositoryImpl(lessonRemoteDataSource: lessonRemoteDataSource)),
    RepositoryProvider<ExcersiceRepository>(create: (context) => ExcersiceRepositoryImpl(excersiceRemoteDataSource: excersiceRemoteDataSource)),
    RepositoryProvider<PersistentStorageRepository>(create: (context) => PersistentStorageImpl()),



    RepositoryProvider<UserUseCase>(create: (context) => UserUseCase(context.read())),
    RepositoryProvider<LessonUseCase>(create: (context) => LessonUseCase(context.read()),),
    RepositoryProvider<ExcersiceUseCase>(create: (context) => ExcersiceUseCase(context.read()),),



  ];
}
