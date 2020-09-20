// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'mahasiswa_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MahasiswaModel _$MahasiswaModelFromJson(Map<String, dynamic> json) {
  return _MahasiswaModel.fromJson(json);
}

class _$MahasiswaModelTearOff {
  const _$MahasiswaModelTearOff();

// ignore: unused_element
  _MahasiswaModel call(
      {int idMahasiswa,
      String nameMahasiswa,
      String emailMahasiswa,
      String telpMahasiswa}) {
    return _MahasiswaModel(
      idMahasiswa: idMahasiswa,
      nameMahasiswa: nameMahasiswa,
      emailMahasiswa: emailMahasiswa,
      telpMahasiswa: telpMahasiswa,
    );
  }
}

// ignore: unused_element
const $MahasiswaModel = _$MahasiswaModelTearOff();

mixin _$MahasiswaModel {
  int get idMahasiswa;
  String get nameMahasiswa;
  String get emailMahasiswa;
  String get telpMahasiswa;

  Map<String, dynamic> toJson();
  $MahasiswaModelCopyWith<MahasiswaModel> get copyWith;
}

abstract class $MahasiswaModelCopyWith<$Res> {
  factory $MahasiswaModelCopyWith(
          MahasiswaModel value, $Res Function(MahasiswaModel) then) =
      _$MahasiswaModelCopyWithImpl<$Res>;
  $Res call(
      {int idMahasiswa,
      String nameMahasiswa,
      String emailMahasiswa,
      String telpMahasiswa});
}

class _$MahasiswaModelCopyWithImpl<$Res>
    implements $MahasiswaModelCopyWith<$Res> {
  _$MahasiswaModelCopyWithImpl(this._value, this._then);

  final MahasiswaModel _value;
  // ignore: unused_field
  final $Res Function(MahasiswaModel) _then;

  @override
  $Res call({
    Object idMahasiswa = freezed,
    Object nameMahasiswa = freezed,
    Object emailMahasiswa = freezed,
    Object telpMahasiswa = freezed,
  }) {
    return _then(_value.copyWith(
      idMahasiswa:
          idMahasiswa == freezed ? _value.idMahasiswa : idMahasiswa as int,
      nameMahasiswa: nameMahasiswa == freezed
          ? _value.nameMahasiswa
          : nameMahasiswa as String,
      emailMahasiswa: emailMahasiswa == freezed
          ? _value.emailMahasiswa
          : emailMahasiswa as String,
      telpMahasiswa: telpMahasiswa == freezed
          ? _value.telpMahasiswa
          : telpMahasiswa as String,
    ));
  }
}

abstract class _$MahasiswaModelCopyWith<$Res>
    implements $MahasiswaModelCopyWith<$Res> {
  factory _$MahasiswaModelCopyWith(
          _MahasiswaModel value, $Res Function(_MahasiswaModel) then) =
      __$MahasiswaModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int idMahasiswa,
      String nameMahasiswa,
      String emailMahasiswa,
      String telpMahasiswa});
}

class __$MahasiswaModelCopyWithImpl<$Res>
    extends _$MahasiswaModelCopyWithImpl<$Res>
    implements _$MahasiswaModelCopyWith<$Res> {
  __$MahasiswaModelCopyWithImpl(
      _MahasiswaModel _value, $Res Function(_MahasiswaModel) _then)
      : super(_value, (v) => _then(v as _MahasiswaModel));

  @override
  _MahasiswaModel get _value => super._value as _MahasiswaModel;

  @override
  $Res call({
    Object idMahasiswa = freezed,
    Object nameMahasiswa = freezed,
    Object emailMahasiswa = freezed,
    Object telpMahasiswa = freezed,
  }) {
    return _then(_MahasiswaModel(
      idMahasiswa:
          idMahasiswa == freezed ? _value.idMahasiswa : idMahasiswa as int,
      nameMahasiswa: nameMahasiswa == freezed
          ? _value.nameMahasiswa
          : nameMahasiswa as String,
      emailMahasiswa: emailMahasiswa == freezed
          ? _value.emailMahasiswa
          : emailMahasiswa as String,
      telpMahasiswa: telpMahasiswa == freezed
          ? _value.telpMahasiswa
          : telpMahasiswa as String,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MahasiswaModel implements _MahasiswaModel {
  const _$_MahasiswaModel(
      {this.idMahasiswa,
      this.nameMahasiswa,
      this.emailMahasiswa,
      this.telpMahasiswa});

  factory _$_MahasiswaModel.fromJson(Map<String, dynamic> json) =>
      _$_$_MahasiswaModelFromJson(json);

  @override
  final int idMahasiswa;
  @override
  final String nameMahasiswa;
  @override
  final String emailMahasiswa;
  @override
  final String telpMahasiswa;

  @override
  String toString() {
    return 'MahasiswaModel(idMahasiswa: $idMahasiswa, nameMahasiswa: $nameMahasiswa, emailMahasiswa: $emailMahasiswa, telpMahasiswa: $telpMahasiswa)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MahasiswaModel &&
            (identical(other.idMahasiswa, idMahasiswa) ||
                const DeepCollectionEquality()
                    .equals(other.idMahasiswa, idMahasiswa)) &&
            (identical(other.nameMahasiswa, nameMahasiswa) ||
                const DeepCollectionEquality()
                    .equals(other.nameMahasiswa, nameMahasiswa)) &&
            (identical(other.emailMahasiswa, emailMahasiswa) ||
                const DeepCollectionEquality()
                    .equals(other.emailMahasiswa, emailMahasiswa)) &&
            (identical(other.telpMahasiswa, telpMahasiswa) ||
                const DeepCollectionEquality()
                    .equals(other.telpMahasiswa, telpMahasiswa)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idMahasiswa) ^
      const DeepCollectionEquality().hash(nameMahasiswa) ^
      const DeepCollectionEquality().hash(emailMahasiswa) ^
      const DeepCollectionEquality().hash(telpMahasiswa);

  @override
  _$MahasiswaModelCopyWith<_MahasiswaModel> get copyWith =>
      __$MahasiswaModelCopyWithImpl<_MahasiswaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MahasiswaModelToJson(this);
  }
}

abstract class _MahasiswaModel implements MahasiswaModel {
  const factory _MahasiswaModel(
      {int idMahasiswa,
      String nameMahasiswa,
      String emailMahasiswa,
      String telpMahasiswa}) = _$_MahasiswaModel;

  factory _MahasiswaModel.fromJson(Map<String, dynamic> json) =
      _$_MahasiswaModel.fromJson;

  @override
  int get idMahasiswa;
  @override
  String get nameMahasiswa;
  @override
  String get emailMahasiswa;
  @override
  String get telpMahasiswa;
  @override
  _$MahasiswaModelCopyWith<_MahasiswaModel> get copyWith;
}
