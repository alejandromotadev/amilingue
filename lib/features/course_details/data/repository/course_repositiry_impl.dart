import 'package:amilingue/features/course_details/data/datasources/course_remote_datasource.dart';
import 'package:amilingue/features/course_details/domain/repository/course_repository.dart';

import '../../domain/entity/course.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource courseRemoteDataSource;

  CourseRepositoryImpl({required this.courseRemoteDataSource});

  @override
  Future<void> createCourse(CourseEntity course) async =>
      courseRemoteDataSource.createCourse(course);
  @override
  Future<void> deleteCourse(CourseEntity course) async =>
      courseRemoteDataSource.deleteCourse(course);

  @override
  Future<List> getCourse() => courseRemoteDataSource.getCourse();

  @override
  Future<void> updateCourse(CourseEntity course) async =>
      courseRemoteDataSource.updateCourse(course);
}
