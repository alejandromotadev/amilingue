




import 'package:amilingue/features/lessons/domain/entities/lesson.dart';

class LessonModel extends LessonEntity{

  final String? name;


  LessonModel(  
      {
      this.name,
      })
      : super(
       name: name,
);


}
