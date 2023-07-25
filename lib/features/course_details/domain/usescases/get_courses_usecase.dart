import 'package:amilingue/features/course_details/domain/repository/course_repository.dart';


class GetCourseUseCase {
  final CourseRepository repository;

  GetCourseUseCase({required this.repository});

  Future<List> call() {
    return repository.getCourse();
  }
}
