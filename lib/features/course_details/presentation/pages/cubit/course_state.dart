part of 'course_cubit.dart';
abstract class CourseState{
  const CourseState();
}

class Loading extends CourseState{
  @override
  List<Object> get props => [];
}

class Loaded extends CourseState{

  const Loaded(this.course);
  final List<dynamic> course;

  List<Object?> get props => [course];
}

class Error extends CourseState{
  @override
  List<Object> get props =>[];
}

class DetailState extends CourseState{
  DetailState(this.course);
  final CourseEntity course;
  @override
  List<Object> get props => [course];
}