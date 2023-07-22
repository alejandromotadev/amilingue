

import 'package:amilingue/features/lessons/domain/entity/lessons.dart';
import 'package:amilingue/features/lessons/domain/repository/lessons_repository.dart';

class DeleteLessonUseCase {
  final LessonRepository repository;

  DeleteLessonUseCase({required this.repository});

  Future<void> call(LessonEntity lesson) {
    return repository.deleteLesson(lesson);
  }
}