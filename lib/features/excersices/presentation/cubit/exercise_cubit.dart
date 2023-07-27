import 'package:amilingue/features/course_details/presentation/pages/cubit/course_cubit.dart';
import 'package:amilingue/features/excersices/data/models/exercise_model.dart';
import 'package:amilingue/features/excersices/domain/entity/exercise.dart';
import 'package:amilingue/features/excersices/domain/usescases/get_exercise_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final GetExerciseUseCase getExerciseUseCase;
  List<dynamic> exerciseList = [];
  ExerciseCubit({required this.getExerciseUseCase}) : super(Loading());

  Future<void> getExcercises() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      try {
        final id =  sharedPreferences.getInt("id_course"); //ID DEL CURSO
        final exercisesFuture = await getExerciseUseCase.call(id);
        final exercises = exercisesFuture;
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
