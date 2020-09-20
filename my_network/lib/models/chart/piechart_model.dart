import 'package:freezed_annotation/freezed_annotation.dart';

part 'piechart_model.freezed.dart';
part 'piechart_model.g.dart';

@freezed
abstract class PieChartModel with _$PieChartModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PieChartModel({
    String title,
    int total,
  }) = _PieChartModel;
  factory PieChartModel.fromJson(Map<String, dynamic> json) => _$PieChartModelFromJson(json);
}
