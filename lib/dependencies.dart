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
import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider> buildRepositories(){
  //final UserRemoteDataSource userRemoteDataSource;
  final UserRemoteDataSource userRemoteDataSource = UserRemoteDataSourceImpl();
  final ExcersiceRemoteDataSource excersiceRemoteDataSource = ExcersiceRemoteDataSourceImpl();
  final LessonRemoteDataSource lessonRemoteDataSource = LessonRemoteDataSourceImpl();
  return[
    //aqui inyectaremos los casos de uso y  repositorios y sus implementaciones
    // EJEMPLO:
    // RepositoryProvider<LoginUseCase>(create: (context)=> LoginUseCase(context.read() #"el context.read() es para que lea los parametros"# ))
    // RepositoryProvider<MyThingRepository>(create: (context)=> MyThingImpl())
    RepositoryProvider<UserUseCase>(create: (context) => UserUseCase(context.read()),),
    RepositoryProvider<UserRepository>(create: (context) => UserRepositoryImpl(userRemoteDataSource: userRemoteDataSource )),

    RepositoryProvider<ExcersiceUseCase>(create: (context) => ExcersiceUseCase(context.read()),),
    RepositoryProvider<ExcersiceRepository>(create: (context) => ExcersiceRepositoryImpl(excersiceRemoteDataSource: excersiceRemoteDataSource)),

    RepositoryProvider<LessonUseCase>(create: (context) => LessonUseCase(context.read()),),
    RepositoryProvider<LessonRepository>(create: (context) => LessonRepositoryImpl(lessonRemoteDataSource: lessonRemoteDataSource)),

  ];
}
