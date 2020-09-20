import 'package:freezed_annotation/freezed_annotation.dart';

part 'mahasiswa_model.freezed.dart';
part 'mahasiswa_model.g.dart';

@freezed
abstract class MahasiswaModel with _$MahasiswaModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MahasiswaModel({
    int idMahasiswa,
    String nameMahasiswa,
    String emailMahasiswa,
    String telpMahasiswa,
  }) = _MahasiswaModel;
  factory MahasiswaModel.fromJson(Map<String, dynamic> json) => _$MahasiswaModelFromJson(json);
}
