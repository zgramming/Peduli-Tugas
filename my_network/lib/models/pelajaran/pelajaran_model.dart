import 'package:freezed_annotation/freezed_annotation.dart';
import '../../my_network.dart';

part 'pelajaran_model.freezed.dart';
part 'pelajaran_model.g.dart';

@freezed
abstract class PelajaranModel with _$PelajaranModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PelajaranModel({
    int idPelajaran,
    String namePelajaran,
    SemesterModel semester,
    List<HariModel> hari,
    DosenModel dosen,
    DateTime waktuPelajaran,
    ReminderModel reminderModel,
    int durationReminder,
  }) = _PelajaranModel;
  factory PelajaranModel.fromJson(Map<String, dynamic> json) => _$PelajaranModelFromJson(json);
}
