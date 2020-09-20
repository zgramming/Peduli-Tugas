// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'piechart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PieChartModel _$PieChartModelFromJson(Map<String, dynamic> json) {
  return _PieChartModel.fromJson(json);
}

class _$PieChartModelTearOff {
  const _$PieChartModelTearOff();

// ignore: unused_element
  _PieChartModel call({String title, int total}) {
    return _PieChartModel(
      title: title,
      total: total,
    );
  }
}

// ignore: unused_element
const $PieChartModel = _$PieChartModelTearOff();

mixin _$PieChartModel {
  String get title;
  int get total;

  Map<String, dynamic> toJson();
  $PieChartModelCopyWith<PieChartModel> get copyWith;
}

abstract class $PieChartModelCopyWith<$Res> {
  factory $PieChartModelCopyWith(
          PieChartModel value, $Res Function(PieChartModel) then) =
      _$PieChartModelCopyWithImpl<$Res>;
  $Res call({String title, int total});
}

class _$PieChartModelCopyWithImpl<$Res>
    implements $PieChartModelCopyWith<$Res> {
  _$PieChartModelCopyWithImpl(this._value, this._then);

  final PieChartModel _value;
  // ignore: unused_field
  final $Res Function(PieChartModel) _then;

  @override
  $Res call({
    Object title = freezed,
    Object total = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      total: total == freezed ? _value.total : total as int,
    ));
  }
}

abstract class _$PieChartModelCopyWith<$Res>
    implements $PieChartModelCopyWith<$Res> {
  factory _$PieChartModelCopyWith(
          _PieChartModel value, $Res Function(_PieChartModel) then) =
      __$PieChartModelCopyWithImpl<$Res>;
  @override
  $Res call({String title, int total});
}

class __$PieChartModelCopyWithImpl<$Res>
    extends _$PieChartModelCopyWithImpl<$Res>
    implements _$PieChartModelCopyWith<$Res> {
  __$PieChartModelCopyWithImpl(
      _PieChartModel _value, $Res Function(_PieChartModel) _then)
      : super(_value, (v) => _then(v as _PieChartModel));

  @override
  _PieChartModel get _value => super._value as _PieChartModel;

  @override
  $Res call({
    Object title = freezed,
    Object total = freezed,
  }) {
    return _then(_PieChartModel(
      title: title == freezed ? _value.title : title as String,
      total: total == freezed ? _value.total : total as int,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_PieChartModel implements _PieChartModel {
  const _$_PieChartModel({this.title, this.total});

  factory _$_PieChartModel.fromJson(Map<String, dynamic> json) =>
      _$_$_PieChartModelFromJson(json);

  @override
  final String title;
  @override
  final int total;

  @override
  String toString() {
    return 'PieChartModel(title: $title, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PieChartModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(total);

  @override
  _$PieChartModelCopyWith<_PieChartModel> get copyWith =>
      __$PieChartModelCopyWithImpl<_PieChartModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PieChartModelToJson(this);
  }
}

abstract class _PieChartModel implements PieChartModel {
  const factory _PieChartModel({String title, int total}) = _$_PieChartModel;

  factory _PieChartModel.fromJson(Map<String, dynamic> json) =
      _$_PieChartModel.fromJson;

  @override
  String get title;
  @override
  int get total;
  @override
  _$PieChartModelCopyWith<_PieChartModel> get copyWith;
}
