
import 'package:amilingue/features/lessons/domain/entity/lessons.dart';

abstract class LessonRemoteDataSource {

  Future<void> createLesson(LessonEntity lesson);
  Stream<List<LessonEntity>> getLesson();
  Future<void> updateLesson(LessonEntity lesson);
  Future<void> deleteLesson(LessonEntity lesson);
}
