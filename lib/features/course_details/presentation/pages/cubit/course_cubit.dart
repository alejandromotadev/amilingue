import 'package:amilingue/features/course_details/domain/usescases/get_courses_usecase.dart';
import 'package:bloc/bloc.dart';
part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final GetCourseUseCase getCourseUseCase;
  List<dynamic> courseList = [];

  CourseCubit({required this.getCourseUseCase}) : super(const Loading());

  Future<void> getCourses() async {
    emit(const Loading());
    try {
      final coursesFuture = getCourseUseCase.call();
      final courses = await coursesFuture;
      courseList = courses;
      // emit(Loaded(courseList)); // Emite la lista cargada después de obtenerla.
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
