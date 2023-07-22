import 'package:equatable/equatable.dart';

class LessonEntity extends Equatable {
  final int? id;
  final String? title;
  final List<String>? subTitle;
  final List<String>?  subText;
  final List<String>?  imgs;
  final List<String>?  videos;


 const LessonEntity(
      {this.id,
      this.title,
      this.subTitle,
      this.subText,
      this.imgs,
      this.videos,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        subTitle,
        subTitle,
        imgs,
        videos,
      ];
}
