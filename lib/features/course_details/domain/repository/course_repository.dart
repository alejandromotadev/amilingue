import 'package:amilingue/features/course_details/domain/entity/course.dart';

abstract class CourseRepository{
  Future<void> createCourse(CourseEntity course);
  Stream<List<CourseEntity>> getCourse();
  Future<void> updateCourse(CourseEntity course);
  Future<void> deleteCourse(CourseEntity course);
}
