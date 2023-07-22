

import '../../domain/entity/course.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    required int? id,
    required String? title,
    required String? description,
    required  List<int>?  topicsIds,
    required List<String>?  imgs,
    required List<int>?  testIds,
  }) : super(
            id: id, title: title, description: description, topicsIds: topicsIds, imgs: imgs, testIds:testIds);
  factory CourseModel.fromJson(Map<String, dynamic>json){
    return CourseModel(
      id:  json["id"],
      title: json["title"],
      description: json["description"],
      topicsIds: json["topicsIds"],
      imgs: json["imgs"],
      testIds: json["testIds"]

    );
  }
  factory CourseModel.fromEntity(CourseEntity courseEntity){
    return CourseModel(id: courseEntity.id, title: courseEntity.title, description: courseEntity.description, topicsIds: courseEntity.topicsIds, imgs: courseEntity.imgs, testIds: courseEntity.testIds);
  }
  Map<String, dynamic>toJson(){
    return{
      "id": id,
      "title": title,
      "description": description,
      "topicsIds": topicsIds,
      "imgs": imgs,
      "testIds": testIds
    };
  }
}
