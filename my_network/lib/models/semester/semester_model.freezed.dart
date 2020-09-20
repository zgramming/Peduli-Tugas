// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'semester_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SemesterModel _$SemesterModelFromJson(Map<String, dynamic> json) {
  return _SemesterModel.fromJson(json);
}

class _$SemesterModelTearOff {
  const _$SemesterModelTearOff();

// ignore: unused_element
  _SemesterModel call({int idSemester, String nameSemester}) {
    return _SemesterModel(
      idSemester: idSemester,
      nameSemester: nameSemester,
    );
  }
}

// ignore: unused_element
const $SemesterModel = _$SemesterModelTearOff();

mixin _$SemesterModel {
  int get idSemester;
  String get nameSemester;

  Map<String, dynamic> toJson();
  $SemesterModelCopyWith<SemesterModel> get copyWith;
}

abstract class $SemesterModelCopyWith<$Res> {
  factory $SemesterModelCopyWith(
          SemesterModel value, $Res Function(SemesterModel) then) =
      _$SemesterModelCopyWithImpl<$Res>;
  $Res call({int idSemester, String nameSemester});
}

class _$SemesterModelCopyWithImpl<$Res>
    implements $SemesterModelCopyWith<$Res> {
  _$SemesterModelCopyWithImpl(this._value, this._then);

  final SemesterModel _value;
  // ignore: unused_field
  final $Res Function(SemesterModel) _then;

  @override
  $Res call({
    Object idSemester = freezed,
    Object nameSemester = freezed,
  }) {
    return _then(_value.copyWith(
      idSemester: idSemester == freezed ? _value.idSemester : idSemester as int,
      nameSemester: nameSemester == freezed
          ? _value.nameSemester
          : nameSemester as String,
    ));
  }
}

abstract class _$SemesterModelCopyWith<$Res>
    implements $SemesterModelCopyWith<$Res> {
  factory _$SemesterModelCopyWith(
          _SemesterModel value, $Res Function(_SemesterModel) then) =
      __$SemesterModelCopyWithImpl<$Res>;
  @override
  $Res call({int idSemester, String nameSemester});
}

class __$SemesterModelCopyWithImpl<$Res>
    extends _$SemesterModelCopyWithImpl<$Res>
    implements _$SemesterModelCopyWith<$Res> {
  __$SemesterModelCopyWithImpl(
      _SemesterModel _value, $Res Function(_SemesterModel) _then)
      : super(_value, (v) => _then(v as _SemesterModel));

  @override
  _SemesterModel get _value => super._value as _SemesterModel;

  @override
  $Res call({
    Object idSemester = freezed,
    Object nameSemester = freezed,
  }) {
    return _then(_SemesterModel(
      idSemester: idSemester == freezed ? _value.idSemester : idSemester as int,
      nameSemester: nameSemester == freezed
          ? _value.nameSemester
          : nameSemester as String,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_SemesterModel implements _SemesterModel {
  const _$_SemesterModel({this.idSemester, this.nameSemester});

  factory _$_SemesterModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SemesterModelFromJson(json);

  @override
  final int idSemester;
  @override
  final String nameSemester;

  @override
  String toString() {
    return 'SemesterModel(idSemester: $idSemester, nameSemester: $nameSemester)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SemesterModel &&
            (identical(other.idSemester, idSemester) ||
                const DeepCollectionEquality()
                    .equals(other.idSemester, idSemester)) &&
            (identical(other.nameSemester, nameSemester) ||
                const DeepCollectionEquality()
                    .equals(other.nameSemester, nameSemester)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idSemester) ^
      const DeepCollectionEquality().hash(nameSemester);

  @override
  _$SemesterModelCopyWith<_SemesterModel> get copyWith =>
      __$SemesterModelCopyWithImpl<_SemesterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SemesterModelToJson(this);
  }
}

abstract class _SemesterModel implements SemesterModel {
  const factory _SemesterModel({int idSemester, String nameSemester}) =
      _$_SemesterModel;

  factory _SemesterModel.fromJson(Map<String, dynamic> json) =
      _$_SemesterModel.fromJson;

  @override
  int get idSemester;
  @override
  String get nameSemester;
  @override
  _$SemesterModelCopyWith<_SemesterModel> get copyWith;
}
