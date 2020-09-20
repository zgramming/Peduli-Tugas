// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dosen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DosenModel _$_$_DosenModelFromJson(Map<String, dynamic> json) {
  return _$_DosenModel(
    idDosen: json['id_dosen'] as int,
    nameDosen: json['name_dosen'] as String,
    imageDosen: json['image_dosen'] as String,
    emailDosen: json['email_dosen'] as String,
    telpDosen: json['telp_dosen'] as String,
  );
}

Map<String, dynamic> _$_$_DosenModelToJson(_$_DosenModel instance) =>
    <String, dynamic>{
      'id_dosen': instance.idDosen,
      'name_dosen': instance.nameDosen,
      'image_dosen': instance.imageDosen,
      'email_dosen': instance.emailDosen,
      'telp_dosen': instance.telpDosen,
    };
