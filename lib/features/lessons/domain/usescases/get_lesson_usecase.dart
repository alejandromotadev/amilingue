

import 'package:amilingue/features/lessons/domain/entity/lessons.dart';
import 'package:amilingue/features/lessons/domain/repository/lessons_repository.dart';

class GetLessonUseCase {
  final LessonRepository repository;

  GetLessonUseCase({required this.repository});

  Stream<List<LessonEntity>> call() {
    return repository.getLesson();
  }
}