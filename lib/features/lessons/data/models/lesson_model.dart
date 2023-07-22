

import '../../domain/entity/lessons.dart';

class LessonModel extends LessonEntity {
  const LessonModel({
    required int? id,
    required String? title,
    required List<String>? subTitle,
    required List<String>? subText,
    required List<String>? imgs,
    required List<String>? videos
  }) : super(
            id: id, title: title, subTitle: subTitle, subText: subText, imgs: imgs, videos:videos);
  factory LessonModel.fromJson(Map<String, dynamic>json){
    return LessonModel(
      id:  json["id"],
      title: json["title"],
      subTitle: json["subTitle"],
      subText: json["subText"],
      imgs: json["imgs"],
      videos: json["videos"]

    );
  }
  factory LessonModel.fromEntity(LessonEntity courseEntity){
    return LessonModel(id: courseEntity.id, title: courseEntity.title, subTitle: courseEntity.subTitle, subText: courseEntity.subText, imgs: courseEntity.imgs, videos: courseEntity.videos);
  }
  Map<String, dynamic>toJson(){
    return{
      "id": id,
      "title": title,
      "subTitle": subTitle,
      "subText": subText,
      "imgs": imgs,
      "videos": videos
    };
  }
}
