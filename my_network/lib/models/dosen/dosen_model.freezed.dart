// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dosen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DosenModel _$DosenModelFromJson(Map<String, dynamic> json) {
  return _DosenModel.fromJson(json);
}

class _$DosenModelTearOff {
  const _$DosenModelTearOff();

// ignore: unused_element
  _DosenModel call(
      {int idDosen,
      String nameDosen,
      String imageDosen,
      String emailDosen,
      String telpDosen}) {
    return _DosenModel(
      idDosen: idDosen,
      nameDosen: nameDosen,
      imageDosen: imageDosen,
      emailDosen: emailDosen,
      telpDosen: telpDosen,
    );
  }
}

// ignore: unused_element
const $DosenModel = _$DosenModelTearOff();

mixin _$DosenModel {
  int get idDosen;
  String get nameDosen;
  String get imageDosen;
  String get emailDosen;
  String get telpDosen;

  Map<String, dynamic> toJson();
  $DosenModelCopyWith<DosenModel> get copyWith;
}

abstract class $DosenModelCopyWith<$Res> {
  factory $DosenModelCopyWith(
          DosenModel value, $Res Function(DosenModel) then) =
      _$DosenModelCopyWithImpl<$Res>;
  $Res call(
      {int idDosen,
      String nameDosen,
      String imageDosen,
      String emailDosen,
      String telpDosen});
}

class _$DosenModelCopyWithImpl<$Res> implements $DosenModelCopyWith<$Res> {
  _$DosenModelCopyWithImpl(this._value, this._then);

  final DosenModel _value;
  // ignore: unused_field
  final $Res Function(DosenModel) _then;

  @override
  $Res call({
    Object idDosen = freezed,
    Object nameDosen = freezed,
    Object imageDosen = freezed,
    Object emailDosen = freezed,
    Object telpDosen = freezed,
  }) {
    return _then(_value.copyWith(
      idDosen: idDosen == freezed ? _value.idDosen : idDosen as int,
      nameDosen: nameDosen == freezed ? _value.nameDosen : nameDosen as String,
      imageDosen:
          imageDosen == freezed ? _value.imageDosen : imageDosen as String,
      emailDosen:
          emailDosen == freezed ? _value.emailDosen : emailDosen as String,
      telpDosen: telpDosen == freezed ? _value.telpDosen : telpDosen as String,
    ));
  }
}

abstract class _$DosenModelCopyWith<$Res> implements $DosenModelCopyWith<$Res> {
  factory _$DosenModelCopyWith(
          _DosenModel value, $Res Function(_DosenModel) then) =
      __$DosenModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int idDosen,
      String nameDosen,
      String imageDosen,
      String emailDosen,
      String telpDosen});
}

class __$DosenModelCopyWithImpl<$Res> extends _$DosenModelCopyWithImpl<$Res>
    implements _$DosenModelCopyWith<$Res> {
  __$DosenModelCopyWithImpl(
      _DosenModel _value, $Res Function(_DosenModel) _then)
      : super(_value, (v) => _then(v as _DosenModel));

  @override
  _DosenModel get _value => super._value as _DosenModel;

  @override
  $Res call({
    Object idDosen = freezed,
    Object nameDosen = freezed,
    Object imageDosen = freezed,
    Object emailDosen = freezed,
    Object telpDosen = freezed,
  }) {
    return _then(_DosenModel(
      idDosen: idDosen == freezed ? _value.idDosen : idDosen as int,
      nameDosen: nameDosen == freezed ? _value.nameDosen : nameDosen as String,
      imageDosen:
          imageDosen == freezed ? _value.imageDosen : imageDosen as String,
      emailDosen:
          emailDosen == freezed ? _value.emailDosen : emailDosen as String,
      telpDosen: telpDosen == freezed ? _value.telpDosen : telpDosen as String,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_DosenModel implements _DosenModel {
  const _$_DosenModel(
      {this.idDosen,
      this.nameDosen,
      this.imageDosen,
      this.emailDosen,
      this.telpDosen});

  factory _$_DosenModel.fromJson(Map<String, dynamic> json) =>
      _$_$_DosenModelFromJson(json);

  @override
  final int idDosen;
  @override
  final String nameDosen;
  @override
  final String imageDosen;
  @override
  final String emailDosen;
  @override
  final String telpDosen;

  @override
  String toString() {
    return 'DosenModel(idDosen: $idDosen, nameDosen: $nameDosen, imageDosen: $imageDosen, emailDosen: $emailDosen, telpDosen: $telpDosen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DosenModel &&
            (identical(other.idDosen, idDosen) ||
                const DeepCollectionEquality()
                    .equals(other.idDosen, idDosen)) &&
            (identical(other.nameDosen, nameDosen) ||
                const DeepCollectionEquality()
                    .equals(other.nameDosen, nameDosen)) &&
            (identical(other.imageDosen, imageDosen) ||
                const DeepCollectionEquality()
                    .equals(other.imageDosen, imageDosen)) &&
            (identical(other.emailDosen, emailDosen) ||
                const DeepCollectionEquality()
                    .equals(other.emailDosen, emailDosen)) &&
            (identical(other.telpDosen, telpDosen) ||
                const DeepCollectionEquality()
                    .equals(other.telpDosen, telpDosen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idDosen) ^
      const DeepCollectionEquality().hash(nameDosen) ^
      const DeepCollectionEquality().hash(imageDosen) ^
      const DeepCollectionEquality().hash(emailDosen) ^
      const DeepCollectionEquality().hash(telpDosen);

  @override
  _$DosenModelCopyWith<_DosenModel> get copyWith =>
      __$DosenModelCopyWithImpl<_DosenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DosenModelToJson(this);
  }
}

abstract class _DosenModel implements DosenModel {
  const factory _DosenModel(
      {int idDosen,
      String nameDosen,
      String imageDosen,
      String emailDosen,
      String telpDosen}) = _$_DosenModel;

  factory _DosenModel.fromJson(Map<String, dynamic> json) =
      _$_DosenModel.fromJson;

  @override
  int get idDosen;
  @override
  String get nameDosen;
  @override
  String get imageDosen;
  @override
  String get emailDosen;
  @override
  String get telpDosen;
  @override
  _$DosenModelCopyWith<_DosenModel> get copyWith;
}
