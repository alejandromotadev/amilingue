
import 'package:amilingue/features/excersices/data/datasources/exercise_remote_datasource.dart';
import 'package:dio/dio.dart';


class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {

  @override
  Future<List> getExercise() async {
    final dio = Dio();
    final response =
        await dio.get('exercise.stevenpadilla.dev/api/v1/exercise');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to fetch Courses');
    }
  }

 
}
