// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tugas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TugasModel _$_$_TugasModelFromJson(Map<String, dynamic> json) {
  return _$_TugasModel(
    idTugas: json['id_tugas'] as int,
    nameTugas: json['name_tugas'] as String,
    deadlineTugas: json['deadline_tugas'] == null
        ? null
        : DateTime.parse(json['deadline_tugas'] as String),
    statusTugas: json['status_tugas'] as bool,
    pelajaran: json['pelajaran'] == null
        ? null
        : PelajaranModel.fromJson(json['pelajaran'] as Map<String, dynamic>),
    deskripsiTugas: json['deskripsi_tugas'] as String,
    reminderModel: json['reminder_model'] == null
        ? null
        : ReminderModel.fromJson(
            json['reminder_model'] as Map<String, dynamic>),
    durationReminder: json['duration_reminder'] as int,
  );
}

Map<String, dynamic> _$_$_TugasModelToJson(_$_TugasModel instance) =>
    <String, dynamic>{
      'id_tugas': instance.idTugas,
      'name_tugas': instance.nameTugas,
      'deadline_tugas': instance.deadlineTugas?.toIso8601String(),
      'status_tugas': instance.statusTugas,
      'pelajaran': instance.pelajaran,
      'deskripsi_tugas': instance.deskripsiTugas,
      'reminder_model': instance.reminderModel,
      'duration_reminder': instance.durationReminder,
    };
