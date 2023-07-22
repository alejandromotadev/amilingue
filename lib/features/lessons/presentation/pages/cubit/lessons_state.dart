part of 'lessons_cubit.dart';

abstract class LessonState {
  const LessonState();
}

class Loading extends LessonState {
  const Loading();
}

class Loaded extends LessonState {
  const Loaded(this.lesson);
  final Stream<List<LessonEntity>> lesson;
}

class Error extends LessonState {
  const Error(this.error);
  final String error;
}
