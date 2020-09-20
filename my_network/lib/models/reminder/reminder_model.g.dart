// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReminderModel _$_$_ReminderModelFromJson(Map<String, dynamic> json) {
  return _$_ReminderModel(
    id: json['id'] as int,
    nameReminder: json['name_reminder'] as String,
    reminderType:
        _$enumDecodeNullable(_$ReminderTypeEnumMap, json['reminder_type']),
  );
}

Map<String, dynamic> _$_$_ReminderModelToJson(_$_ReminderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_reminder': instance.nameReminder,
      'reminder_type': _$ReminderTypeEnumMap[instance.reminderType],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ReminderTypeEnumMap = {
  ReminderType.JanganIngkatkan: 'JanganIngkatkan',
  ReminderType.Menit: 'Menit',
  ReminderType.Jam: 'Jam',
  ReminderType.Hari: 'Hari',
};
