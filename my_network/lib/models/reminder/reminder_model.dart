import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_model.freezed.dart';
part 'reminder_model.g.dart';

enum ReminderType { JanganIngkatkan, Menit, Jam, Hari }

@freezed
abstract class ReminderModel with _$ReminderModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReminderModel({
    int id,
    String nameReminder,
    ReminderType reminderType,
  }) = _ReminderModel;
  factory ReminderModel.fromJson(Map<String, dynamic> json) => _$ReminderModelFromJson(json);
}

final List<ReminderModel> listReminder = [
  ReminderModel(
      id: 0, nameReminder: 'Jangan Ingkatkan', reminderType: ReminderType.JanganIngkatkan),
  ReminderModel(id: 1, nameReminder: 'Menit', reminderType: ReminderType.Menit),
  ReminderModel(id: 2, nameReminder: 'Jam', reminderType: ReminderType.Jam),
  ReminderModel(id: 3, nameReminder: 'Hari', reminderType: ReminderType.Hari),
];
