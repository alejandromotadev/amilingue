part of 'exercise_cubit.dart';
abstract class ExerciseState{
  const ExerciseState();
}

class Loading extends ExerciseState{
  @override
  List<Object> get props => [];
}

class Loaded extends ExerciseState{

  const Loaded(this.exercise);
  final List<dynamic> exercise;

  List<Object?> get props => [exercise];
}

class Error extends ExerciseState{
  @override
  List<Object> get props =>[];
}

class DetailState extends ExerciseState{
  DetailState(this.exercise);
  final ExerciseEntity exercise;
  @override
  List<Object> get props => [exercise];
}