import 'package:amilingue/features/course_details/data/datasources/course_remote_datasource.dart';
import 'package:amilingue/features/course_details/domain/entity/course.dart';
import 'package:dio/dio.dart';


class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  @override
  Future<void> deleteCourse(CourseEntity course) async {
    final idCourse = course.id;
    final dio = Dio();
    try {
      final response = await dio
          .delete('lesson.stevenpadilla.dev/course/api/v1/course/$idCourse');
      if (response.statusCode == 200) {
        print("Deleted");
      } else {
        throw Exception('Server error');
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Future<List> getCourse() async {
    final dio = Dio();
    final response =
        await dio.get('https://course.stevenpadilla.dev/api/v1/courses');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to fetch Courses');
    }
  }

  @override
  Future<void> updateCourse(CourseEntity course) async {
    var dio = Dio();

    try {
      final response = await dio
          .put('lesson.stevenpadilla.dev/course/api/v1/Courses', data: {
        "id": course.id,
        "title": course.title,
        "description": course.description,
        "exervisesIds": course.exercisesIds,
        "testIds": course.testIds,
        "topicsIds": course.topicsIds,
        "imgs": course.imgs
      });
      if (response.statusCode == 200) {
        print("updated");
      } else {
        throw Exception('Server error');
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Future<void> createCourse(CourseEntity course) async {
    const api = "lesson.stevenpadilla.dev/course/api/v1/course";
    final data = {
      "id": course.id,
      "title": course.title,
      "description": course.description,
      "exervisesIds": course.exercisesIds,
      "testIds": course.testIds,
      "topicsIds": course.topicsIds,
      "imgs": course.imgs
    };
    final dio = Dio();
    Response response;
    try {
      response = await dio.post(api, data: data);
      final body = response.data;
      print(body);
    } catch (error) {
      print("error en funcion create Courses$error");
    }
  }
}
