// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'tugas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TugasModel _$TugasModelFromJson(Map<String, dynamic> json) {
  return _TugasModel.fromJson(json);
}

class _$TugasModelTearOff {
  const _$TugasModelTearOff();

// ignore: unused_element
  _TugasModel call(
      {int idTugas,
      String nameTugas,
      DateTime deadlineTugas,
      bool statusTugas,
      PelajaranModel pelajaran,
      String deskripsiTugas,
      ReminderModel reminderModel,
      int durationReminder}) {
    return _TugasModel(
      idTugas: idTugas,
      nameTugas: nameTugas,
      deadlineTugas: deadlineTugas,
      statusTugas: statusTugas,
      pelajaran: pelajaran,
      deskripsiTugas: deskripsiTugas,
      reminderModel: reminderModel,
      durationReminder: durationReminder,
    );
  }
}

// ignore: unused_element
const $TugasModel = _$TugasModelTearOff();

mixin _$TugasModel {
  int get idTugas;
  String get nameTugas;
  DateTime get deadlineTugas;
  bool get statusTugas;
  PelajaranModel get pelajaran;
  String get deskripsiTugas;
  ReminderModel get reminderModel;
  int get durationReminder;

  Map<String, dynamic> toJson();
  $TugasModelCopyWith<TugasModel> get copyWith;
}

abstract class $TugasModelCopyWith<$Res> {
  factory $TugasModelCopyWith(
          TugasModel value, $Res Function(TugasModel) then) =
      _$TugasModelCopyWithImpl<$Res>;
  $Res call(
      {int idTugas,
      String nameTugas,
      DateTime deadlineTugas,
      bool statusTugas,
      PelajaranModel pelajaran,
      String deskripsiTugas,
      ReminderModel reminderModel,
      int durationReminder});

  $PelajaranModelCopyWith<$Res> get pelajaran;
  $ReminderModelCopyWith<$Res> get reminderModel;
}

class _$TugasModelCopyWithImpl<$Res> implements $TugasModelCopyWith<$Res> {
  _$TugasModelCopyWithImpl(this._value, this._then);

  final TugasModel _value;
  // ignore: unused_field
  final $Res Function(TugasModel) _then;

  @override
  $Res call({
    Object idTugas = freezed,
    Object nameTugas = freezed,
    Object deadlineTugas = freezed,
    Object statusTugas = freezed,
    Object pelajaran = freezed,
    Object deskripsiTugas = freezed,
    Object reminderModel = freezed,
    Object durationReminder = freezed,
  }) {
    return _then(_value.copyWith(
      idTugas: idTugas == freezed ? _value.idTugas : idTugas as int,
      nameTugas: nameTugas == freezed ? _value.nameTugas : nameTugas as String,
      deadlineTugas: deadlineTugas == freezed
          ? _value.deadlineTugas
          : deadlineTugas as DateTime,
      statusTugas:
          statusTugas == freezed ? _value.statusTugas : statusTugas as bool,
      pelajaran:
          pelajaran == freezed ? _value.pelajaran : pelajaran as PelajaranModel,
      deskripsiTugas: deskripsiTugas == freezed
          ? _value.deskripsiTugas
          : deskripsiTugas as String,
      reminderModel: reminderModel == freezed
          ? _value.reminderModel
          : reminderModel as ReminderModel,
      durationReminder: durationReminder == freezed
          ? _value.durationReminder
          : durationReminder as int,
    ));
  }

  @override
  $PelajaranModelCopyWith<$Res> get pelajaran {
    if (_value.pelajaran == null) {
      return null;
    }
    return $PelajaranModelCopyWith<$Res>(_value.pelajaran, (value) {
      return _then(_value.copyWith(pelajaran: value));
    });
  }

  @override
  $ReminderModelCopyWith<$Res> get reminderModel {
    if (_value.reminderModel == null) {
      return null;
    }
    return $ReminderModelCopyWith<$Res>(_value.reminderModel, (value) {
      return _then(_value.copyWith(reminderModel: value));
    });
  }
}

abstract class _$TugasModelCopyWith<$Res> implements $TugasModelCopyWith<$Res> {
  factory _$TugasModelCopyWith(
          _TugasModel value, $Res Function(_TugasModel) then) =
      __$TugasModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int idTugas,
      String nameTugas,
      DateTime deadlineTugas,
      bool statusTugas,
      PelajaranModel pelajaran,
      String deskripsiTugas,
      ReminderModel reminderModel,
      int durationReminder});

  @override
  $PelajaranModelCopyWith<$Res> get pelajaran;
  @override
  $ReminderModelCopyWith<$Res> get reminderModel;
}

class __$TugasModelCopyWithImpl<$Res> extends _$TugasModelCopyWithImpl<$Res>
    implements _$TugasModelCopyWith<$Res> {
  __$TugasModelCopyWithImpl(
      _TugasModel _value, $Res Function(_TugasModel) _then)
      : super(_value, (v) => _then(v as _TugasModel));

  @override
  _TugasModel get _value => super._value as _TugasModel;

  @override
  $Res call({
    Object idTugas = freezed,
    Object nameTugas = freezed,
    Object deadlineTugas = freezed,
    Object statusTugas = freezed,
    Object pelajaran = freezed,
    Object deskripsiTugas = freezed,
    Object reminderModel = freezed,
    Object durationReminder = freezed,
  }) {
    return _then(_TugasModel(
      idTugas: idTugas == freezed ? _value.idTugas : idTugas as int,
      nameTugas: nameTugas == freezed ? _value.nameTugas : nameTugas as String,
      deadlineTugas: deadlineTugas == freezed
          ? _value.deadlineTugas
          : deadlineTugas as DateTime,
      statusTugas:
          statusTugas == freezed ? _value.statusTugas : statusTugas as bool,
      pelajaran:
          pelajaran == freezed ? _value.pelajaran : pelajaran as PelajaranModel,
      deskripsiTugas: deskripsiTugas == freezed
          ? _value.deskripsiTugas
          : deskripsiTugas as String,
      reminderModel: reminderModel == freezed
          ? _value.reminderModel
          : reminderModel as ReminderModel,
      durationReminder: durationReminder == freezed
          ? _value.durationReminder
          : durationReminder as int,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_TugasModel implements _TugasModel {
  const _$_TugasModel(
      {this.idTugas,
      this.nameTugas,
      this.deadlineTugas,
      this.statusTugas,
      this.pelajaran,
      this.deskripsiTugas,
      this.reminderModel,
      this.durationReminder});

  factory _$_TugasModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TugasModelFromJson(json);

  @override
  final int idTugas;
  @override
  final String nameTugas;
  @override
  final DateTime deadlineTugas;
  @override
  final bool statusTugas;
  @override
  final PelajaranModel pelajaran;
  @override
  final String deskripsiTugas;
  @override
  final ReminderModel reminderModel;
  @override
  final int durationReminder;

  @override
  String toString() {
    return 'TugasModel(idTugas: $idTugas, nameTugas: $nameTugas, deadlineTugas: $deadlineTugas, statusTugas: $statusTugas, pelajaran: $pelajaran, deskripsiTugas: $deskripsiTugas, reminderModel: $reminderModel, durationReminder: $durationReminder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TugasModel &&
            (identical(other.idTugas, idTugas) ||
                const DeepCollectionEquality()
                    .equals(other.idTugas, idTugas)) &&
            (identical(other.nameTugas, nameTugas) ||
                const DeepCollectionEquality()
                    .equals(other.nameTugas, nameTugas)) &&
            (identical(other.deadlineTugas, deadlineTugas) ||
                const DeepCollectionEquality()
                    .equals(other.deadlineTugas, deadlineTugas)) &&
            (identical(other.statusTugas, statusTugas) ||
                const DeepCollectionEquality()
                    .equals(other.statusTugas, statusTugas)) &&
            (identical(other.pelajaran, pelajaran) ||
                const DeepCollectionEquality()
                    .equals(other.pelajaran, pelajaran)) &&
            (identical(other.deskripsiTugas, deskripsiTugas) ||
                const DeepCollectionEquality()
                    .equals(other.deskripsiTugas, deskripsiTugas)) &&
            (identical(other.reminderModel, reminderModel) ||
                const DeepCollectionEquality()
                    .equals(other.reminderModel, reminderModel)) &&
            (identical(other.durationReminder, durationReminder) ||
                const DeepCollectionEquality()
                    .equals(other.durationReminder, durationReminder)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idTugas) ^
      const DeepCollectionEquality().hash(nameTugas) ^
      const DeepCollectionEquality().hash(deadlineTugas) ^
      const DeepCollectionEquality().hash(statusTugas) ^
      const DeepCollectionEquality().hash(pelajaran) ^
      const DeepCollectionEquality().hash(deskripsiTugas) ^
      const DeepCollectionEquality().hash(reminderModel) ^
      const DeepCollectionEquality().hash(durationReminder);

  @override
  _$TugasModelCopyWith<_TugasModel> get copyWith =>
      __$TugasModelCopyWithImpl<_TugasModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TugasModelToJson(this);
  }
}

abstract class _TugasModel implements TugasModel {
  const factory _TugasModel(
      {int idTugas,
      String nameTugas,
      DateTime deadlineTugas,
      bool statusTugas,
      PelajaranModel pelajaran,
      String deskripsiTugas,
      ReminderModel reminderModel,
      int durationReminder}) = _$_TugasModel;

  factory _TugasModel.fromJson(Map<String, dynamic> json) =
      _$_TugasModel.fromJson;

  @override
  int get idTugas;
  @override
  String get nameTugas;
  @override
  DateTime get deadlineTugas;
  @override
  bool get statusTugas;
  @override
  PelajaranModel get pelajaran;
  @override
  String get deskripsiTugas;
  @override
  ReminderModel get reminderModel;
  @override
  int get durationReminder;
  @override
  _$TugasModelCopyWith<_TugasModel> get copyWith;
}
