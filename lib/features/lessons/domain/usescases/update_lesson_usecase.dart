
import 'package:amilingue/features/lessons/domain/entity/lessons.dart';
import 'package:amilingue/features/lessons/domain/repository/lessons_repository.dart';


class UpdateLessonUseCase {
  final LessonRepository repository;

  UpdateLessonUseCase({required this.repository});

  Future<void> call(LessonEntity lesson) {
    return repository.updateLesson(lesson);
  }
}