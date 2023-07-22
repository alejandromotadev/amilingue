
import 'package:amilingue/features/lessons/domain/entity/lessons.dart';
import 'package:amilingue/features/lessons/domain/repository/lessons_repository.dart';

class CreateLessonUseCase {
  final LessonRepository repository;

  CreateLessonUseCase({required this.repository});

  Future<void> call(LessonEntity lesson) {
    return repository.createLesson(lesson);
  }
}
