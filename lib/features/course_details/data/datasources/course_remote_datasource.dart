import 'package:amilingue/features/course_details/domain/entity/course.dart';

abstract class CourseRemoteDataSource {
  Future<void> createCourse(CourseEntity course);
  Future<List> getCourse();
  Future<void> updateCourse(CourseEntity course);
  Future<void> deleteCourse(CourseEntity course);
}
