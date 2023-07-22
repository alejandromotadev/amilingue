

import 'package:amilingue/features/lessons/data/datasources/lesson_remote_datasource.dart';
import 'package:amilingue/features/lessons/data/models/lesson_model.dart';

import 'package:amilingue/features/lessons/domain/entity/lessons.dart';
import 'package:dio/dio.dart';


class LessonRemoteDataSourceImpl implements LessonRemoteDataSource {
  @override
  Future<void> deleteLesson(LessonEntity lesson)async {
    final idLesson = lesson.id;
    final dio = Dio();
    try {
      final response = await dio.delete('lesson.stevenpadilla.dev/api/v1/lessons/$idLesson');
      if (response.statusCode == 200){
        print("Deleted");
      }else {
      throw Exception('Server error');
    }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Stream<List<LessonEntity>> getLesson() async* {
    final dio = Dio();
    final response =
        await dio.get('lesson.stevenpadilla.dev/api/v1/lessons');

    if (response.statusCode == 200) {
      final lessonList = (response.data["data"] as List)
          .map((e) => LessonModel.fromJson(e))
          .toList();
      yield lessonList;
    } else {
      throw Exception('Failed to fetch lessons');
    }
  }

  @override
  Future<void> updateLesson(LessonEntity lesson)async {
    var dio = Dio();
    
    try {
      final response = await dio.put('lesson.stevenpadilla.dev/api/v1/lessons', data:  {
      "id": lesson.id,
      "title": lesson.title,
      "subTitle": lesson.subTitle,
      "subText": lesson.subText,
      "videos": lesson.videos,
      "imgs": lesson.imgs
    });
      if (response.statusCode == 200){
        print("updated");
      }else {
      throw Exception('Server error');
    }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Future<void> createLesson(LessonEntity lesson) async {
    const api = "lesson.stevenpadilla.dev/api/v1/lessons";
    final data = {
      "id": lesson.id,
      "title": lesson.title,
      "subTitle": lesson.subTitle,
      "subText": lesson.subText,
      "videos": lesson.videos,
      "imgs": lesson.imgs
    };
    final dio = Dio();
    Response response;
    try {
      response = await dio.post(api, data: data);
      final body = response.data;
      print(body);

    } catch (error) {
      print("error en funcion create lessons$error");
    }
  }
}
