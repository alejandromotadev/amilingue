
import 'package:amilingue/features/excersices/data/datasources/exercise_remote_datasource.dart';
import 'package:amilingue/features/excersices/domain/repository/exercise_repository.dart';


class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource exerciseRemoteDataSource;

  ExerciseRepositoryImpl({required this.exerciseRemoteDataSource});


  @override
  Future<List> getExercise() => exerciseRemoteDataSource.getExercise();


}
