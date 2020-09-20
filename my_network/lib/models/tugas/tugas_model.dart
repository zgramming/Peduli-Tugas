import 'package:freezed_annotation/freezed_annotation.dart';
import '../../my_network.dart';

part 'tugas_model.freezed.dart';
part 'tugas_model.g.dart';

@freezed
abstract class TugasModel with _$TugasModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TugasModel({
    int idTugas,
    String nameTugas,
    DateTime deadlineTugas,
    bool statusTugas,
    PelajaranModel pelajaran,
    String deskripsiTugas,
    ReminderModel reminderModel,
    int durationReminder,
  }) = _TugasModel;
  factory TugasModel.fromJson(Map<String, dynamic> json) => _$TugasModelFromJson(json);
}
