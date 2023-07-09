import 'package:amilingue/features/authentication/data/datasources/user_datasource_impl.dart';
import 'package:amilingue/features/authentication/data/datasources/user_remote_datasource.dart';
import 'package:amilingue/features/authentication/data/repository/user_repository_impl.dart';
import 'package:amilingue/features/authentication/domain/repositories/user_repository.dart';
import 'package:amilingue/features/authentication/domain/usecases/user_usecase.dart';
import 'package:amilingue/features/profile/data/datasources/profile_datasources.dart';
import 'package:amilingue/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:amilingue/features/profile/data/repository/persistent_storage_repository_impl.dart';
import 'package:amilingue/features/profile/domain/repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider> buildRepositories(){
  final UserRemoteDataSource userRemoteDataSourceImpl = UserRemoteDataSourceImpl();
  final PersistentStorageRemoteDataSource persistentStorageRemoteDataSourceImpl = PersistentStorageDataSourcesImpl();


  return[
    RepositoryProvider<UserRemoteDataSource>(create: (context)=> UserRemoteDataSourceImpl()),
    RepositoryProvider<UserRepository>(create: (context) => UserRepositoryImpl(userRemoteDataSource: userRemoteDataSourceImpl)),

    RepositoryProvider<PersistentStorageRemoteDataSource>(create:(context)=>PersistentStorageDataSourcesImpl()),
    RepositoryProvider<PersistentStorageRepository>(create: (context)=> PersistentStorageRepositoryImpl(persistentStorageRemoteDataSource: persistentStorageRemoteDataSourceImpl)),


    //Use cases
    RepositoryProvider<UserUseCase>(create: (context) => UserUseCase(context.read())),
  ];
}
