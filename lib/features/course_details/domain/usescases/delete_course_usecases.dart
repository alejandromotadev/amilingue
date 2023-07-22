
import 'package:amilingue/features/course_details/domain/repository/course_repository.dart';
import 'package:amilingue/features/course_details/domain/entity/course.dart';

class DeleteCourseUseCase {
  final CourseRepository repository;

  DeleteCourseUseCase({required this.repository});

  Future<void> call(CourseEntity course) {
    return repository.deleteCourse(course);
  }
}