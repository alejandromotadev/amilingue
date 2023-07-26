import '../../domain/entity/exercise.dart';

class ExerciseModel extends ExerciseEntity {
  const ExerciseModel({
    required int? id,
    required String? createdAt,
    required String? updatedAt,
    required List<String>? setences,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          setences: setences,
        );
  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json["id"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      setences: json["setences"],
    );
  }
  factory ExerciseModel.fromEntity(ExerciseEntity exerciseEntity) {
    return ExerciseModel(
      id: exerciseEntity.id,
      createdAt: exerciseEntity.createdAt,
      updatedAt: exerciseEntity.updatedAt,
      setences: exerciseEntity.setences,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "setences": setences,
    };
  }
}
