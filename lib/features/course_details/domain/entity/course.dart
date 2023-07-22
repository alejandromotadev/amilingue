

import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final List<int>?  topicsIds;
  final List<int>? exercisesIds;
  final List<String>?  imgs;
  final List<int>?  testIds;


 const CourseEntity(
      {this.id,
      this.title,
      this.description,
      this.topicsIds,
      this.exercisesIds,
      this.imgs,
      this.testIds,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        description,
        topicsIds,
        exercisesIds,
        imgs,
        testIds,
      ];
}
