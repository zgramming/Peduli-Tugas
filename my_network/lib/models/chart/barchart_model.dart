import 'package:freezed_annotation/freezed_annotation.dart';

part 'barchart_model.freezed.dart';
part 'barchart_model.g.dart';

@freezed
abstract class BarChartModel with _$BarChartModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BarChartModel({
    DateTime date,
    int totalTugas,
    int totalSelesai,
  }) = _BarChartModel;
  factory BarChartModel.fromJson(Map<String, dynamic> json) => _$BarChartModelFromJson(json);
}
