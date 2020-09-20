// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'barchart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
BarChartModel _$BarChartModelFromJson(Map<String, dynamic> json) {
  return _BarChartModel.fromJson(json);
}

class _$BarChartModelTearOff {
  const _$BarChartModelTearOff();

// ignore: unused_element
  _BarChartModel call({DateTime date, int totalTugas, int totalSelesai}) {
    return _BarChartModel(
      date: date,
      totalTugas: totalTugas,
      totalSelesai: totalSelesai,
    );
  }
}

// ignore: unused_element
const $BarChartModel = _$BarChartModelTearOff();

mixin _$BarChartModel {
  DateTime get date;
  int get totalTugas;
  int get totalSelesai;

  Map<String, dynamic> toJson();
  $BarChartModelCopyWith<BarChartModel> get copyWith;
}

abstract class $BarChartModelCopyWith<$Res> {
  factory $BarChartModelCopyWith(
          BarChartModel value, $Res Function(BarChartModel) then) =
      _$BarChartModelCopyWithImpl<$Res>;
  $Res call({DateTime date, int totalTugas, int totalSelesai});
}

class _$BarChartModelCopyWithImpl<$Res>
    implements $BarChartModelCopyWith<$Res> {
  _$BarChartModelCopyWithImpl(this._value, this._then);

  final BarChartModel _value;
  // ignore: unused_field
  final $Res Function(BarChartModel) _then;

  @override
  $Res call({
    Object date = freezed,
    Object totalTugas = freezed,
    Object totalSelesai = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed ? _value.date : date as DateTime,
      totalTugas: totalTugas == freezed ? _value.totalTugas : totalTugas as int,
      totalSelesai:
          totalSelesai == freezed ? _value.totalSelesai : totalSelesai as int,
    ));
  }
}

abstract class _$BarChartModelCopyWith<$Res>
    implements $BarChartModelCopyWith<$Res> {
  factory _$BarChartModelCopyWith(
          _BarChartModel value, $Res Function(_BarChartModel) then) =
      __$BarChartModelCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, int totalTugas, int totalSelesai});
}

class __$BarChartModelCopyWithImpl<$Res>
    extends _$BarChartModelCopyWithImpl<$Res>
    implements _$BarChartModelCopyWith<$Res> {
  __$BarChartModelCopyWithImpl(
      _BarChartModel _value, $Res Function(_BarChartModel) _then)
      : super(_value, (v) => _then(v as _BarChartModel));

  @override
  _BarChartModel get _value => super._value as _BarChartModel;

  @override
  $Res call({
    Object date = freezed,
    Object totalTugas = freezed,
    Object totalSelesai = freezed,
  }) {
    return _then(_BarChartModel(
      date: date == freezed ? _value.date : date as DateTime,
      totalTugas: totalTugas == freezed ? _value.totalTugas : totalTugas as int,
      totalSelesai:
          totalSelesai == freezed ? _value.totalSelesai : totalSelesai as int,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BarChartModel implements _BarChartModel {
  const _$_BarChartModel({this.date, this.totalTugas, this.totalSelesai});

  factory _$_BarChartModel.fromJson(Map<String, dynamic> json) =>
      _$_$_BarChartModelFromJson(json);

  @override
  final DateTime date;
  @override
  final int totalTugas;
  @override
  final int totalSelesai;

  @override
  String toString() {
    return 'BarChartModel(date: $date, totalTugas: $totalTugas, totalSelesai: $totalSelesai)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BarChartModel &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.totalTugas, totalTugas) ||
                const DeepCollectionEquality()
                    .equals(other.totalTugas, totalTugas)) &&
            (identical(other.totalSelesai, totalSelesai) ||
                const DeepCollectionEquality()
                    .equals(other.totalSelesai, totalSelesai)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(totalTugas) ^
      const DeepCollectionEquality().hash(totalSelesai);

  @override
  _$BarChartModelCopyWith<_BarChartModel> get copyWith =>
      __$BarChartModelCopyWithImpl<_BarChartModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BarChartModelToJson(this);
  }
}

abstract class _BarChartModel implements BarChartModel {
  const factory _BarChartModel(
      {DateTime date, int totalTugas, int totalSelesai}) = _$_BarChartModel;

  factory _BarChartModel.fromJson(Map<String, dynamic> json) =
      _$_BarChartModel.fromJson;

  @override
  DateTime get date;
  @override
  int get totalTugas;
  @override
  int get totalSelesai;
  @override
  _$BarChartModelCopyWith<_BarChartModel> get copyWith;
}
