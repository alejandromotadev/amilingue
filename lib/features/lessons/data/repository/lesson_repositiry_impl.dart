
import 'package:amilingue/features/lessons/data/datasources/lesson_remote_datasource.dart';
import 'package:amilingue/features/lessons/domain/repository/lessons_repository.dart';


import '../../domain/entity/lessons.dart';


class  LessonRepositoryImpl implements LessonRepository{
  final LessonRemoteDataSource lessonRemoteDataSource;

  LessonRepositoryImpl({ required this.lessonRemoteDataSource});


  @override
  Future<void> createLesson(LessonEntity lesson) async => lessonRemoteDataSource.createLesson(lesson);
  @override
  Future<void> deleteLesson(LessonEntity lesson) async => lessonRemoteDataSource.deleteLesson(lesson);



  @override
  Stream<List<LessonEntity>> getLesson() => lessonRemoteDataSource.getLesson();

  @override
  Future<void> updateLesson(LessonEntity lesson) async => lessonRemoteDataSource.updateLesson(lesson);



  
  
}