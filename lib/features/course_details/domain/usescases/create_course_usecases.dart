
import 'package:amilingue/features/course_details/domain/repository/course_repository.dart';
import 'package:amilingue/features/course_details/domain/entity/course.dart';

class CreateCourseUseCase {
  final CourseRepository repository;

  CreateCourseUseCase({required this.repository});

  Future<void> call(CourseEntity course) {
    return repository.createCourse(course);
  }
}