


import 'package:amilingue/features/lessons/data/datasources/lesson_remote_datasource.dart';
import 'package:amilingue/features/lessons/domain/repositories/lesson_repository.dart';



class LessonRepositoryImpl implements LessonRepository{
  final LessonRemoteDataSource lessonRemoteDataSource;

  LessonRepositoryImpl({required this.lessonRemoteDataSource});



}