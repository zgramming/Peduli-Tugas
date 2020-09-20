import 'package:freezed_annotation/freezed_annotation.dart';

part 'semester_model.freezed.dart';
part 'semester_model.g.dart';

@freezed
abstract class SemesterModel with _$SemesterModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SemesterModel({
    int idSemester,
    String nameSemester,
  }) = _SemesterModel;
  factory SemesterModel.fromJson(Map<String, dynamic> json) => _$SemesterModelFromJson(json);
}

final List<SemesterModel> listSemester = [
  SemesterModel(idSemester: 1, nameSemester: 'Semester I'),
  SemesterModel(idSemester: 2, nameSemester: 'Semester II'),
  SemesterModel(idSemester: 3, nameSemester: 'Semester III'),
  SemesterModel(idSemester: 4, nameSemester: 'Semester VI'),
  SemesterModel(idSemester: 5, nameSemester: 'Semester V'),
  SemesterModel(idSemester: 6, nameSemester: 'Semester VI'),
  SemesterModel(idSemester: 7, nameSemester: 'Semester VII'),
  SemesterModel(idSemester: 8, nameSemester: 'Semester VIII'),
];
