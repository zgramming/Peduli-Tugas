import 'package:freezed_annotation/freezed_annotation.dart';

part 'dosen_model.freezed.dart';
part 'dosen_model.g.dart';

@freezed
abstract class DosenModel with _$DosenModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DosenModel({
    int idDosen,
    String nameDosen,
    String imageDosen,
    String emailDosen,
    String telpDosen,
  }) = _DosenModel;
  factory DosenModel.fromJson(Map<String, dynamic> json) => _$DosenModelFromJson(json);
}

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'dosen_model.freezed.dart';
// part 'dosen_model.g.dart';
// @freezed
// abstract class UtangModel with _$UtangModel {
//   @JsonSerializable(fieldRename: FieldRename.snake)
//   const factory UtangModel({}) = _UtangModel;
// factory UtangModel.fromJson(Map<String, dynamic> json) => _$UtangModelFromJson(json);

// }
