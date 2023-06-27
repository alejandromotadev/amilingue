
import 'dart:io';


import 'package:amilingue/features/exercises/data/datasources/excersice_remote_datasource.dart';
import 'package:amilingue/features/exercises/domain/repositories/excersice_repository.dart';

class ExcersiceRepositoryImpl implements ExcersiceRepository{
  final ExcersiceRemoteDataSource excersiceRemoteDataSource;

  ExcersiceRepositoryImpl({required this.excersiceRemoteDataSource});



}