// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'pelajaran_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PelajaranModel _$PelajaranModelFromJson(Map<String, dynamic> json) {
  return _PelajaranModel.fromJson(json);
}

class _$PelajaranModelTearOff {
  const _$PelajaranModelTearOff();

// ignore: unused_element
  _PelajaranModel call(
      {int idPelajaran,
      String namePelajaran,
      SemesterModel semester,
      List<HariModel> hari,
      DosenModel dosen,
      DateTime waktuPelajaran,
      ReminderModel reminderModel,
      int durationReminder}) {
    return _PelajaranModel(
      idPelajaran: idPelajaran,
      namePelajaran: namePelajaran,
      semester: semester,
      hari: hari,
      dosen: dosen,
      waktuPelajaran: waktuPelajaran,
      reminderModel: reminderModel,
      durationReminder: durationReminder,
    );
  }
}

// ignore: unused_element
const $PelajaranModel = _$PelajaranModelTearOff();

mixin _$PelajaranModel {
  int get idPelajaran;
  String get namePelajaran;
  SemesterModel get semester;
  List<HariModel> get hari;
  DosenModel get dosen;
  DateTime get waktuPelajaran;
  ReminderModel get reminderModel;
  int get durationReminder;

  Map<String, dynamic> toJson();
  $PelajaranModelCopyWith<PelajaranModel> get copyWith;
}

abstract class $PelajaranModelCopyWith<$Res> {
  factory $PelajaranModelCopyWith(
          PelajaranModel value, $Res Function(PelajaranModel) then) =
      _$PelajaranModelCopyWithImpl<$Res>;
  $Res call(
      {int idPelajaran,
      String namePelajaran,
      SemesterModel semester,
      List<HariModel> hari,
      DosenModel dosen,
      DateTime waktuPelajaran,
      ReminderModel reminderModel,
      int durationReminder});

  $SemesterModelCopyWith<$Res> get semester;
  $DosenModelCopyWith<$Res> get dosen;
  $ReminderModelCopyWith<$Res> get reminderModel;
}

class _$PelajaranModelCopyWithImpl<$Res>
    implements $PelajaranModelCopyWith<$Res> {
  _$PelajaranModelCopyWithImpl(this._value, this._then);

  final PelajaranModel _value;
  // ignore: unused_field
  final $Res Function(PelajaranModel) _then;

  @override
  $Res call({
    Object idPelajaran = freezed,
    Object namePelajaran = freezed,
    Object semester = freezed,
    Object hari = freezed,
    Object dosen = freezed,
    Object waktuPelajaran = freezed,
    Object reminderModel = freezed,
    Object durationReminder = freezed,
  }) {
    return _then(_value.copyWith(
      idPelajaran:
          idPelajaran == freezed ? _value.idPelajaran : idPelajaran as int,
      namePelajaran: namePelajaran == freezed
          ? _value.namePelajaran
          : namePelajaran as String,
      semester:
          semester == freezed ? _value.semester : semester as SemesterModel,
      hari: hari == freezed ? _value.hari : hari as List<HariModel>,
      dosen: dosen == freezed ? _value.dosen : dosen as DosenModel,
      waktuPelajaran: waktuPelajaran == freezed
          ? _value.waktuPelajaran
          : waktuPelajaran as DateTime,
      reminderModel: reminderModel == freezed
          ? _value.reminderModel
          : reminderModel as ReminderModel,
      durationReminder: durationReminder == freezed
          ? _value.durationReminder
          : durationReminder as int,
    ));
  }

  @override
  $SemesterModelCopyWith<$Res> get semester {
    if (_value.semester == null) {
      return null;
    }
    return $SemesterModelCopyWith<$Res>(_value.semester, (value) {
      return _then(_value.copyWith(semester: value));
    });
  }

  @override
  $DosenModelCopyWith<$Res> get dosen {
    if (_value.dosen == null) {
      return null;
    }
    return $DosenModelCopyWith<$Res>(_value.dosen, (value) {
      return _then(_value.copyWith(dosen: value));
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

abstract class _$PelajaranModelCopyWith<$Res>
    implements $PelajaranModelCopyWith<$Res> {
  factory _$PelajaranModelCopyWith(
          _PelajaranModel value, $Res Function(_PelajaranModel) then) =
      __$PelajaranModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int idPelajaran,
      String namePelajaran,
      SemesterModel semester,
      List<HariModel> hari,
      DosenModel dosen,
      DateTime waktuPelajaran,
      ReminderModel reminderModel,
      int durationReminder});

  @override
  $SemesterModelCopyWith<$Res> get semester;
  @override
  $DosenModelCopyWith<$Res> get dosen;
  @override
  $ReminderModelCopyWith<$Res> get reminderModel;
}

class __$PelajaranModelCopyWithImpl<$Res>
    extends _$PelajaranModelCopyWithImpl<$Res>
    implements _$PelajaranModelCopyWith<$Res> {
  __$PelajaranModelCopyWithImpl(
      _PelajaranModel _value, $Res Function(_PelajaranModel) _then)
      : super(_value, (v) => _then(v as _PelajaranModel));

  @override
  _PelajaranModel get _value => super._value as _PelajaranModel;

  @override
  $Res call({
    Object idPelajaran = freezed,
    Object namePelajaran = freezed,
    Object semester = freezed,
    Object hari = freezed,
    Object dosen = freezed,
    Object waktuPelajaran = freezed,
    Object reminderModel = freezed,
    Object durationReminder = freezed,
  }) {
    return _then(_PelajaranModel(
      idPelajaran:
          idPelajaran == freezed ? _value.idPelajaran : idPelajaran as int,
      namePelajaran: namePelajaran == freezed
          ? _value.namePelajaran
          : namePelajaran as String,
      semester:
          semester == freezed ? _value.semester : semester as SemesterModel,
      hari: hari == freezed ? _value.hari : hari as List<HariModel>,
      dosen: dosen == freezed ? _value.dosen : dosen as DosenModel,
      waktuPelajaran: waktuPelajaran == freezed
          ? _value.waktuPelajaran
          : waktuPelajaran as DateTime,
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
class _$_PelajaranModel implements _PelajaranModel {
  const _$_PelajaranModel(
      {this.idPelajaran,
      this.namePelajaran,
      this.semester,
      this.hari,
      this.dosen,
      this.waktuPelajaran,
      this.reminderModel,
      this.durationReminder});

  factory _$_PelajaranModel.fromJson(Map<String, dynamic> json) =>
      _$_$_PelajaranModelFromJson(json);

  @override
  final int idPelajaran;
  @override
  final String namePelajaran;
  @override
  final SemesterModel semester;
  @override
  final List<HariModel> hari;
  @override
  final DosenModel dosen;
  @override
  final DateTime waktuPelajaran;
  @override
  final ReminderModel reminderModel;
  @override
  final int durationReminder;

  @override
  String toString() {
    return 'PelajaranModel(idPelajaran: $idPelajaran, namePelajaran: $namePelajaran, semester: $semester, hari: $hari, dosen: $dosen, waktuPelajaran: $waktuPelajaran, reminderModel: $reminderModel, durationReminder: $durationReminder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PelajaranModel &&
            (identical(other.idPelajaran, idPelajaran) ||
                const DeepCollectionEquality()
                    .equals(other.idPelajaran, idPelajaran)) &&
            (identical(other.namePelajaran, namePelajaran) ||
                const DeepCollectionEquality()
                    .equals(other.namePelajaran, namePelajaran)) &&
            (identical(other.semester, semester) ||
                const DeepCollectionEquality()
                    .equals(other.semester, semester)) &&
            (identical(other.hari, hari) ||
                const DeepCollectionEquality().equals(other.hari, hari)) &&
            (identical(other.dosen, dosen) ||
                const DeepCollectionEquality().equals(other.dosen, dosen)) &&
            (identical(other.waktuPelajaran, waktuPelajaran) ||
                const DeepCollectionEquality()
                    .equals(other.waktuPelajaran, waktuPelajaran)) &&
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
      const DeepCollectionEquality().hash(idPelajaran) ^
      const DeepCollectionEquality().hash(namePelajaran) ^
      const DeepCollectionEquality().hash(semester) ^
      const DeepCollectionEquality().hash(hari) ^
      const DeepCollectionEquality().hash(dosen) ^
      const DeepCollectionEquality().hash(waktuPelajaran) ^
      const DeepCollectionEquality().hash(reminderModel) ^
      const DeepCollectionEquality().hash(durationReminder);

  @override
  _$PelajaranModelCopyWith<_PelajaranModel> get copyWith =>
      __$PelajaranModelCopyWithImpl<_PelajaranModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PelajaranModelToJson(this);
  }
}

abstract class _PelajaranModel implements PelajaranModel {
  const factory _PelajaranModel(
      {int idPelajaran,
      String namePelajaran,
      SemesterModel semester,
      List<HariModel> hari,
      DosenModel dosen,
      DateTime waktuPelajaran,
      ReminderModel reminderModel,
      int durationReminder}) = _$_PelajaranModel;

  factory _PelajaranModel.fromJson(Map<String, dynamic> json) =
      _$_PelajaranModel.fromJson;

  @override
  int get idPelajaran;
  @override
  String get namePelajaran;
  @override
  SemesterModel get semester;
  @override
  List<HariModel> get hari;
  @override
  DosenModel get dosen;
  @override
  DateTime get waktuPelajaran;
  @override
  ReminderModel get reminderModel;
  @override
  int get durationReminder;
  @override
  _$PelajaranModelCopyWith<_PelajaranModel> get copyWith;
}
