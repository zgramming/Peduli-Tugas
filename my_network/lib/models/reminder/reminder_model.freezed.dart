// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'reminder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) {
  return _ReminderModel.fromJson(json);
}

class _$ReminderModelTearOff {
  const _$ReminderModelTearOff();

// ignore: unused_element
  _ReminderModel call(
      {int id, String nameReminder, ReminderType reminderType}) {
    return _ReminderModel(
      id: id,
      nameReminder: nameReminder,
      reminderType: reminderType,
    );
  }
}

// ignore: unused_element
const $ReminderModel = _$ReminderModelTearOff();

mixin _$ReminderModel {
  int get id;
  String get nameReminder;
  ReminderType get reminderType;

  Map<String, dynamic> toJson();
  $ReminderModelCopyWith<ReminderModel> get copyWith;
}

abstract class $ReminderModelCopyWith<$Res> {
  factory $ReminderModelCopyWith(
          ReminderModel value, $Res Function(ReminderModel) then) =
      _$ReminderModelCopyWithImpl<$Res>;
  $Res call({int id, String nameReminder, ReminderType reminderType});
}

class _$ReminderModelCopyWithImpl<$Res>
    implements $ReminderModelCopyWith<$Res> {
  _$ReminderModelCopyWithImpl(this._value, this._then);

  final ReminderModel _value;
  // ignore: unused_field
  final $Res Function(ReminderModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object nameReminder = freezed,
    Object reminderType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      nameReminder: nameReminder == freezed
          ? _value.nameReminder
          : nameReminder as String,
      reminderType: reminderType == freezed
          ? _value.reminderType
          : reminderType as ReminderType,
    ));
  }
}

abstract class _$ReminderModelCopyWith<$Res>
    implements $ReminderModelCopyWith<$Res> {
  factory _$ReminderModelCopyWith(
          _ReminderModel value, $Res Function(_ReminderModel) then) =
      __$ReminderModelCopyWithImpl<$Res>;
  @override
  $Res call({int id, String nameReminder, ReminderType reminderType});
}

class __$ReminderModelCopyWithImpl<$Res>
    extends _$ReminderModelCopyWithImpl<$Res>
    implements _$ReminderModelCopyWith<$Res> {
  __$ReminderModelCopyWithImpl(
      _ReminderModel _value, $Res Function(_ReminderModel) _then)
      : super(_value, (v) => _then(v as _ReminderModel));

  @override
  _ReminderModel get _value => super._value as _ReminderModel;

  @override
  $Res call({
    Object id = freezed,
    Object nameReminder = freezed,
    Object reminderType = freezed,
  }) {
    return _then(_ReminderModel(
      id: id == freezed ? _value.id : id as int,
      nameReminder: nameReminder == freezed
          ? _value.nameReminder
          : nameReminder as String,
      reminderType: reminderType == freezed
          ? _value.reminderType
          : reminderType as ReminderType,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ReminderModel implements _ReminderModel {
  const _$_ReminderModel({this.id, this.nameReminder, this.reminderType});

  factory _$_ReminderModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ReminderModelFromJson(json);

  @override
  final int id;
  @override
  final String nameReminder;
  @override
  final ReminderType reminderType;

  @override
  String toString() {
    return 'ReminderModel(id: $id, nameReminder: $nameReminder, reminderType: $reminderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReminderModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nameReminder, nameReminder) ||
                const DeepCollectionEquality()
                    .equals(other.nameReminder, nameReminder)) &&
            (identical(other.reminderType, reminderType) ||
                const DeepCollectionEquality()
                    .equals(other.reminderType, reminderType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nameReminder) ^
      const DeepCollectionEquality().hash(reminderType);

  @override
  _$ReminderModelCopyWith<_ReminderModel> get copyWith =>
      __$ReminderModelCopyWithImpl<_ReminderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReminderModelToJson(this);
  }
}

abstract class _ReminderModel implements ReminderModel {
  const factory _ReminderModel(
      {int id,
      String nameReminder,
      ReminderType reminderType}) = _$_ReminderModel;

  factory _ReminderModel.fromJson(Map<String, dynamic> json) =
      _$_ReminderModel.fromJson;

  @override
  int get id;
  @override
  String get nameReminder;
  @override
  ReminderType get reminderType;
  @override
  _$ReminderModelCopyWith<_ReminderModel> get copyWith;
}
