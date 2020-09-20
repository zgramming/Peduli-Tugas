// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'global_statenotifier_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GlobalStateNotifierModel _$GlobalStateNotifierModelFromJson(
    Map<String, dynamic> json) {
  return _GlobalStateNotifierModel.fromJson(json);
}

class _$GlobalStateNotifierModelTearOff {
  const _$GlobalStateNotifierModelTearOff();

// ignore: unused_element
  _GlobalStateNotifierModel call(
      {bool isLoading, bool isImageLoading, bool isDarkMode}) {
    return _GlobalStateNotifierModel(
      isLoading: isLoading,
      isImageLoading: isImageLoading,
      isDarkMode: isDarkMode,
    );
  }
}

// ignore: unused_element
const $GlobalStateNotifierModel = _$GlobalStateNotifierModelTearOff();

mixin _$GlobalStateNotifierModel {
  bool get isLoading;
  bool get isImageLoading;
  bool get isDarkMode;

  Map<String, dynamic> toJson();
  $GlobalStateNotifierModelCopyWith<GlobalStateNotifierModel> get copyWith;
}

abstract class $GlobalStateNotifierModelCopyWith<$Res> {
  factory $GlobalStateNotifierModelCopyWith(GlobalStateNotifierModel value,
          $Res Function(GlobalStateNotifierModel) then) =
      _$GlobalStateNotifierModelCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isImageLoading, bool isDarkMode});
}

class _$GlobalStateNotifierModelCopyWithImpl<$Res>
    implements $GlobalStateNotifierModelCopyWith<$Res> {
  _$GlobalStateNotifierModelCopyWithImpl(this._value, this._then);

  final GlobalStateNotifierModel _value;
  // ignore: unused_field
  final $Res Function(GlobalStateNotifierModel) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object isImageLoading = freezed,
    Object isDarkMode = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isImageLoading: isImageLoading == freezed
          ? _value.isImageLoading
          : isImageLoading as bool,
      isDarkMode:
          isDarkMode == freezed ? _value.isDarkMode : isDarkMode as bool,
    ));
  }
}

abstract class _$GlobalStateNotifierModelCopyWith<$Res>
    implements $GlobalStateNotifierModelCopyWith<$Res> {
  factory _$GlobalStateNotifierModelCopyWith(_GlobalStateNotifierModel value,
          $Res Function(_GlobalStateNotifierModel) then) =
      __$GlobalStateNotifierModelCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isImageLoading, bool isDarkMode});
}

class __$GlobalStateNotifierModelCopyWithImpl<$Res>
    extends _$GlobalStateNotifierModelCopyWithImpl<$Res>
    implements _$GlobalStateNotifierModelCopyWith<$Res> {
  __$GlobalStateNotifierModelCopyWithImpl(_GlobalStateNotifierModel _value,
      $Res Function(_GlobalStateNotifierModel) _then)
      : super(_value, (v) => _then(v as _GlobalStateNotifierModel));

  @override
  _GlobalStateNotifierModel get _value =>
      super._value as _GlobalStateNotifierModel;

  @override
  $Res call({
    Object isLoading = freezed,
    Object isImageLoading = freezed,
    Object isDarkMode = freezed,
  }) {
    return _then(_GlobalStateNotifierModel(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      isImageLoading: isImageLoading == freezed
          ? _value.isImageLoading
          : isImageLoading as bool,
      isDarkMode:
          isDarkMode == freezed ? _value.isDarkMode : isDarkMode as bool,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_GlobalStateNotifierModel implements _GlobalStateNotifierModel {
  const _$_GlobalStateNotifierModel(
      {this.isLoading, this.isImageLoading, this.isDarkMode});

  factory _$_GlobalStateNotifierModel.fromJson(Map<String, dynamic> json) =>
      _$_$_GlobalStateNotifierModelFromJson(json);

  @override
  final bool isLoading;
  @override
  final bool isImageLoading;
  @override
  final bool isDarkMode;

  @override
  String toString() {
    return 'GlobalStateNotifierModel(isLoading: $isLoading, isImageLoading: $isImageLoading, isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GlobalStateNotifierModel &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isImageLoading, isImageLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isImageLoading, isImageLoading)) &&
            (identical(other.isDarkMode, isDarkMode) ||
                const DeepCollectionEquality()
                    .equals(other.isDarkMode, isDarkMode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isImageLoading) ^
      const DeepCollectionEquality().hash(isDarkMode);

  @override
  _$GlobalStateNotifierModelCopyWith<_GlobalStateNotifierModel> get copyWith =>
      __$GlobalStateNotifierModelCopyWithImpl<_GlobalStateNotifierModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GlobalStateNotifierModelToJson(this);
  }
}

abstract class _GlobalStateNotifierModel implements GlobalStateNotifierModel {
  const factory _GlobalStateNotifierModel(
      {bool isLoading,
      bool isImageLoading,
      bool isDarkMode}) = _$_GlobalStateNotifierModel;

  factory _GlobalStateNotifierModel.fromJson(Map<String, dynamic> json) =
      _$_GlobalStateNotifierModel.fromJson;

  @override
  bool get isLoading;
  @override
  bool get isImageLoading;
  @override
  bool get isDarkMode;
  @override
  _$GlobalStateNotifierModelCopyWith<_GlobalStateNotifierModel> get copyWith;
}
