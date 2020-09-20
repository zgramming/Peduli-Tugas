// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barchart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BarChartModel _$_$_BarChartModelFromJson(Map<String, dynamic> json) {
  return _$_BarChartModel(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    totalTugas: json['total_tugas'] as int,
    totalSelesai: json['total_selesai'] as int,
  );
}

Map<String, dynamic> _$_$_BarChartModelToJson(_$_BarChartModel instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'total_tugas': instance.totalTugas,
      'total_selesai': instance.totalSelesai,
    };
