
import '../repository/exercise_repository.dart';

class GetExerciseUseCase {
  final ExerciseRepository repository;

  GetExerciseUseCase({required this.repository});

  Future<List> call(id) {
    return repository.getExercise(id);
  }
}
