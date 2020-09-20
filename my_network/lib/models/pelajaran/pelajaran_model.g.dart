// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pelajaran_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PelajaranModel _$_$_PelajaranModelFromJson(Map<String, dynamic> json) {
  return _$_PelajaranModel(
    idPelajaran: json['id_pelajaran'] as int,
    namePelajaran: json['name_pelajaran'] as String,
    semester: json['semester'] == null
        ? null
        : SemesterModel.fromJson(json['semester'] as Map<String, dynamic>),
    hari: (json['hari'] as List)
        ?.map((e) =>
            e == null ? null : HariModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dosen: json['dosen'] == null
        ? null
        : DosenModel.fromJson(json['dosen'] as Map<String, dynamic>),
    waktuPelajaran: json['waktu_pelajaran'] == null
        ? null
        : DateTime.parse(json['waktu_pelajaran'] as String),
    reminderModel: json['reminder_model'] == null
        ? null
        : ReminderModel.fromJson(
            json['reminder_model'] as Map<String, dynamic>),
    durationReminder: json['duration_reminder'] as int,
  );
}

Map<String, dynamic> _$_$_PelajaranModelToJson(_$_PelajaranModel instance) =>
    <String, dynamic>{
      'id_pelajaran': instance.idPelajaran,
      'name_pelajaran': instance.namePelajaran,
      'semester': instance.semester,
      'hari': instance.hari,
      'dosen': instance.dosen,
      'waktu_pelajaran': instance.waktuPelajaran?.toIso8601String(),
      'reminder_model': instance.reminderModel,
      'duration_reminder': instance.durationReminder,
    };
