// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MahasiswaModel _$_$_MahasiswaModelFromJson(Map<String, dynamic> json) {
  return _$_MahasiswaModel(
    idMahasiswa: json['id_mahasiswa'] as int,
    nameMahasiswa: json['name_mahasiswa'] as String,
    emailMahasiswa: json['email_mahasiswa'] as String,
    telpMahasiswa: json['telp_mahasiswa'] as String,
  );
}

Map<String, dynamic> _$_$_MahasiswaModelToJson(_$_MahasiswaModel instance) =>
    <String, dynamic>{
      'id_mahasiswa': instance.idMahasiswa,
      'name_mahasiswa': instance.nameMahasiswa,
      'email_mahasiswa': instance.emailMahasiswa,
      'telp_mahasiswa': instance.telpMahasiswa,
    };
