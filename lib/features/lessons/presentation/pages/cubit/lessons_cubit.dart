
import 'package:amilingue/features/lessons/domain/entity/lessons.dart';
import 'package:amilingue/features/lessons/domain/usescases/get_lesson_usecase.dart';
import 'package:bloc/bloc.dart';

part 'lessons_state.dart';

class LessonCubit extends Cubit<LessonState> {
  final GetLessonUseCase getLessonUseCase;

  LessonCubit({required this.getLessonUseCase}) : super(const Loading());
  
  Future<void> getLessons() async {
    emit(const Loading());
    try {
      final lessons =  getLessonUseCase.call();
      emit(Loaded(lessons));
      
    } catch (e) {
      emit(Error(e.toString()));
      
    }
  }
}