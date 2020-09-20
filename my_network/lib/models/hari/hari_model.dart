import 'package:freezed_annotation/freezed_annotation.dart';

part 'hari_model.freezed.dart';
part 'hari_model.g.dart';

@freezed
abstract class HariModel with _$HariModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HariModel({
    int idDay,
    String nameDay,
    int codeColor,
  }) = _HariModel;
  factory HariModel.fromJson(Map<String, dynamic> json) => _$HariModelFromJson(json);
}

final listHari = [
  HariModel(idDay: 1, nameDay: 'Senin', codeColor: 0xFFF17105),
  HariModel(idDay: 2, nameDay: 'Selasa', codeColor: 0xFFD11149),
  HariModel(idDay: 3, nameDay: 'Rabu', codeColor: 0xFF6610F2),
  HariModel(idDay: 4, nameDay: 'Kamis', codeColor: 0xFF1A8FE3),
  HariModel(idDay: 5, nameDay: 'Jumat', codeColor: 0xFFC200FB),
  HariModel(idDay: 6, nameDay: 'Sabtu', codeColor: 0xFFF63E02),
  HariModel(idDay: 7, nameDay: 'Minggu', codeColor: 0xFFE10000),
];
