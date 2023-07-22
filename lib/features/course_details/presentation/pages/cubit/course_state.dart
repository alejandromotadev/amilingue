part of 'course_cubit.dart';
abstract class CourseState{
  const CourseState();
}

class Loading extends CourseState{
  const Loading();
}

class Loaded extends CourseState{

  const Loaded(this.course);
  final Stream<List<CourseEntity>> course;
}

class Error extends CourseState{
  const Error(this.error);
  final String error;
}