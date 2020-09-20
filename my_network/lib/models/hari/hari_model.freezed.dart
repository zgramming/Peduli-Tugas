// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'hari_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HariModel _$HariModelFromJson(Map<String, dynamic> json) {
  return _HariModel.fromJson(json);
}

class _$HariModelTearOff {
  const _$HariModelTearOff();

// ignore: unused_element
  _HariModel call({int idDay, String nameDay, int codeColor}) {
    return _HariModel(
      idDay: idDay,
      nameDay: nameDay,
      codeColor: codeColor,
    );
  }
}

// ignore: unused_element
const $HariModel = _$HariModelTearOff();

mixin _$HariModel {
  int get idDay;
  String get nameDay;
  int get codeColor;

  Map<String, dynamic> toJson();
  $HariModelCopyWith<HariModel> get copyWith;
}

abstract class $HariModelCopyWith<$Res> {
  factory $HariModelCopyWith(HariModel value, $Res Function(HariModel) then) =
      _$HariModelCopyWithImpl<$Res>;
  $Res call({int idDay, String nameDay, int codeColor});
}

class _$HariModelCopyWithImpl<$Res> implements $HariModelCopyWith<$Res> {
  _$HariModelCopyWithImpl(this._value, this._then);

  final HariModel _value;
  // ignore: unused_field
  final $Res Function(HariModel) _then;

  @override
  $Res call({
    Object idDay = freezed,
    Object nameDay = freezed,
    Object codeColor = freezed,
  }) {
    return _then(_value.copyWith(
      idDay: idDay == freezed ? _value.idDay : idDay as int,
      nameDay: nameDay == freezed ? _value.nameDay : nameDay as String,
      codeColor: codeColor == freezed ? _value.codeColor : codeColor as int,
    ));
  }
}

abstract class _$HariModelCopyWith<$Res> implements $HariModelCopyWith<$Res> {
  factory _$HariModelCopyWith(
          _HariModel value, $Res Function(_HariModel) then) =
      __$HariModelCopyWithImpl<$Res>;
  @override
  $Res call({int idDay, String nameDay, int codeColor});
}

class __$HariModelCopyWithImpl<$Res> extends _$HariModelCopyWithImpl<$Res>
    implements _$HariModelCopyWith<$Res> {
  __$HariModelCopyWithImpl(_HariModel _value, $Res Function(_HariModel) _then)
      : super(_value, (v) => _then(v as _HariModel));

  @override
  _HariModel get _value => super._value as _HariModel;

  @override
  $Res call({
    Object idDay = freezed,
    Object nameDay = freezed,
    Object codeColor = freezed,
  }) {
    return _then(_HariModel(
      idDay: idDay == freezed ? _value.idDay : idDay as int,
      nameDay: nameDay == freezed ? _value.nameDay : nameDay as String,
      codeColor: codeColor == freezed ? _value.codeColor : codeColor as int,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_HariModel implements _HariModel {
  const _$_HariModel({this.idDay, this.nameDay, this.codeColor});

  factory _$_HariModel.fromJson(Map<String, dynamic> json) =>
      _$_$_HariModelFromJson(json);

  @override
  final int idDay;
  @override
  final String nameDay;
  @override
  final int codeColor;

  @override
  String toString() {
    return 'HariModel(idDay: $idDay, nameDay: $nameDay, codeColor: $codeColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HariModel &&
            (identical(other.idDay, idDay) ||
                const DeepCollectionEquality().equals(other.idDay, idDay)) &&
            (identical(other.nameDay, nameDay) ||
                const DeepCollectionEquality()
                    .equals(other.nameDay, nameDay)) &&
            (identical(other.codeColor, codeColor) ||
                const DeepCollectionEquality()
                    .equals(other.codeColor, codeColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idDay) ^
      const DeepCollectionEquality().hash(nameDay) ^
      const DeepCollectionEquality().hash(codeColor);

  @override
  _$HariModelCopyWith<_HariModel> get copyWith =>
      __$HariModelCopyWithImpl<_HariModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HariModelToJson(this);
  }
}

abstract class _HariModel implements HariModel {
  const factory _HariModel({int idDay, String nameDay, int codeColor}) =
      _$_HariModel;

  factory _HariModel.fromJson(Map<String, dynamic> json) =
      _$_HariModel.fromJson;

  @override
  int get idDay;
  @override
  String get nameDay;
  @override
  int get codeColor;
  @override
  _$HariModelCopyWith<_HariModel> get copyWith;
}
