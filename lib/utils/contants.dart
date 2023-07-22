//COLORS

import 'package:amilingue/features/course_details/data/datasources/cousese_remote_datasource_impl.dart';
import 'package:amilingue/features/course_details/data/repository/course_repositiry_impl.dart';
import 'package:amilingue/features/course_details/domain/usescases/create_course_usecases.dart';
import 'package:amilingue/features/course_details/domain/usescases/delete_course_usecases.dart';
import 'package:amilingue/features/course_details/domain/usescases/get_courses_usecase.dart';
import 'package:amilingue/features/course_details/domain/usescases/update_courses_usecase.dart';
import 'package:amilingue/features/lessons/data/datasources/lesson_remote_datasource_impl.dart';
import 'package:amilingue/features/lessons/data/repository/lesson_repositiry_impl.dart';
import 'package:amilingue/features/lessons/domain/usescases/get_lesson_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const primaryBackground = Color(0xffFFFFFF);
const secondaryBackground = Color(0xff906CF3);
const primaryTextColor = Color(0xff4E4E4E);
const blackTextColor = Color(0xff4A4A4A);
const buttonColor = Color(0xffFFF6FF);
const checkColor = Color(0xffA8FFBB);

const darkmodebutton = Color(0xff906cf3);
const darkmodeTextColor = Color(0xffFFFFFF);
const darkmodeprimarycolor = Color(0xff000000);
const darkmodeSecondarycolor = Color(0xffFFFFFF);

class ButtonConstant extends StatelessWidget {
  //
  ButtonConstant(
      {required this.widthSize,
      required this.heightSize,
      required this.backgroundColor,
      required this.text,
      required this.color});

  final double widthSize;
  final double heightSize;
  final Color backgroundColor;
  final String text;
  final Color color;

  Widget build(BuildContext context) {
    return Container(
      width: widthSize,
      height: heightSize,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 4))
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w800, color: color),
        ),
      ),
    );
  }
}

class UsecaseConfig {
  late GetLessonUseCase getLessonUsecase;
  late GetCourseUseCase getCourseUsecase;
  late CreateCourseUseCase createCourseUsecase;
  late UpdateCourseUseCase updateCourseUsecase;
  late DeleteCourseUseCase deleteCourseUsecase;
  late CourseRepositoryImpl courseRepositoryImpl;
  late CourseRemoteDataSourceImpl courseRemoteDataSourceImpl;
  late LessonRepositoryImpl lessonRepositoryImpl;
  late LessonRemoteDataSourceImpl lessonRemoteDataSourceImpl;

  UsecaseConfig() {
    courseRemoteDataSourceImpl = CourseRemoteDataSourceImpl();
    courseRepositoryImpl = CourseRepositoryImpl(courseRemoteDataSource: courseRemoteDataSourceImpl);
    lessonRemoteDataSourceImpl = LessonRemoteDataSourceImpl();
    lessonRepositoryImpl = LessonRepositoryImpl(lessonRemoteDataSource: lessonRemoteDataSourceImpl);

    getCourseUsecase = GetCourseUseCase( repository: courseRepositoryImpl);
    createCourseUsecase = CreateCourseUseCase(repository: courseRepositoryImpl);
    updateCourseUsecase = UpdateCourseUseCase(repository: courseRepositoryImpl);
    deleteCourseUsecase = DeleteCourseUseCase(repository: courseRepositoryImpl);
    getLessonUsecase = GetLessonUseCase(repository: lessonRepositoryImpl);
  }
}