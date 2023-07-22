
import 'package:amilingue/features/course_details/domain/entity/course.dart';
import 'package:amilingue/features/course_details/domain/usescases/get_courses_usecase.dart';
import 'package:bloc/bloc.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final GetCourseUseCase getCourseUseCase;

  CourseCubit({required this.getCourseUseCase}) : super(const Loading());
  
  Future<void> getCourses() async {
    emit(const Loading());
    try {
      final courses =  getCourseUseCase.call();
      emit(Loaded(courses));
      
    } catch (e) {
      emit(Error(e.toString()));
      
    }
  }
}