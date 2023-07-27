
import 'package:amilingue/features/excersices/data/datasources/exercise_remote_datasource.dart';
import 'package:dio/dio.dart';


class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {

  @override
  Future<List> getExercise(id) async {
    final dio = Dio();
    final response =
        await dio.get('https://exercise.stevenpadilla.dev/api/v1/exercise/$id');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to fetch Courses');
    }
  }

 
}
