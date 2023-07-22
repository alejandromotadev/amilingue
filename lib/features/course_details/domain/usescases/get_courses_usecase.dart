
import 'package:amilingue/features/course_details/domain/repository/course_repository.dart';
import 'package:amilingue/features/course_details/domain/entity/course.dart';

class GetCourseUseCase {
  final CourseRepository repository;

  GetCourseUseCase({required this.repository});

  Stream<List<CourseEntity>> call() {
    return repository.getCourse();
  }
}