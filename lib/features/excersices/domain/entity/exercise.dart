import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final List<String>? setences;

  const ExerciseEntity({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.setences,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        setences,

      ];
}
