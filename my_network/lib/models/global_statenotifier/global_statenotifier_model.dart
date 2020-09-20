import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_statenotifier_model.freezed.dart';
part 'global_statenotifier_model.g.dart';

@freezed
abstract class GlobalStateNotifierModel with _$GlobalStateNotifierModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GlobalStateNotifierModel({
    bool isLoading,
    bool isImageLoading,
    bool isDarkMode,
  }) = _GlobalStateNotifierModel;
  factory GlobalStateNotifierModel.fromJson(Map<String, dynamic> json) =>
      _$GlobalStateNotifierModelFromJson(json);
}
