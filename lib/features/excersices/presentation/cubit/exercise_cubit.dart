import 'package:amilingue/features/excersices/data/models/exercise_model.dart';
import 'package:amilingue/features/excersices/domain/entity/exercise.dart';
import 'package:amilingue/features/excersices/domain/usescases/get_exercise_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final GetExerciseUseCase getExerciseUseCase;
  List<dynamic> exerciseList = [];

  ExerciseCubit({required this.getExerciseUseCase}) : super(Loading());

  Future<void> getExcercises() async {
    emit( Loading());
    try {
      final exercisesFuture = getExerciseUseCase.call();
      final exercises = await exercisesFuture;
      exerciseList = exercises;
      emit(Loaded(exerciseList)); // Emite la lista cargada después de obtenerla.
    } catch (e) {
      emit(Error());
    }

  }
  detailPage(ExerciseModel exercise){
    emit(DetailState(exercise));
  }
}
