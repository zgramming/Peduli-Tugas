import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FormType { IsFormPelajaran, IsFormTugas }

///* For Form Dosen
final DosenBase64Image = StateProvider.autoDispose<String>((ref) {
  final dosenModelEdit = ref.watch(DosenModelEdit).state;
  if (dosenModelEdit.idDosen == null) {
    return null;
  } else {
    return dosenModelEdit.imageDosen;
  }
});

///* END Form Dosen

///* For Form Pelajaran
final PelajaranSelectedDay = StateProvider.autoDispose<List<HariModel>>((ref) {
  final pelajaranModelEdit = ref.watch(PelajaranModelEdit).state;
  if (pelajaranModelEdit.idPelajaran == null) {
    return [];
  } else {
    return pelajaranModelEdit.hari;
  }
});
final PelajaranDropdownDosen = StateProvider.autoDispose<DosenModel>((ref) {
  final pelajaranModelEdit = ref.watch(PelajaranModelEdit).state;
  if (pelajaranModelEdit.idPelajaran == null) {
    return null;
  } else {
    return pelajaranModelEdit.dosen;
  }
});

final PelajaranDropdownSemester = StateProvider.autoDispose<SemesterModel>((ref) {
  final pelajaranModelEdit = ref.watch(PelajaranModelEdit).state;
  if (pelajaranModelEdit.idPelajaran == null) {
    return null;
  } else {
    return pelajaranModelEdit.semester;
  }
});

final PelajaranSelectedTime = StateProvider.autoDispose<TimeOfDay>((ref) {
  final pelajaranModelEdit = ref.watch(PelajaranModelEdit).state;
  if (pelajaranModelEdit.idPelajaran == null) {
    return TimeOfDay.now();
  } else {
    return TimeOfDay.fromDateTime(pelajaranModelEdit.waktuPelajaran);
  }
});

final PelajaranReminderType = StateProvider.autoDispose<ReminderModel>((ref) {
  final pelajaranModelEdit = ref.watch(PelajaranModelEdit).state;

  if (pelajaranModelEdit.idPelajaran == null) {
    return null;
  } else {
    return pelajaranModelEdit.reminderModel;
  }
});

final PelajaranReminderValue = StateProvider.autoDispose<int>((ref) {
  final pelajaranModelEdit = ref.watch(PelajaranModelEdit).state;
  if (pelajaranModelEdit.idPelajaran == null) {
    return 0;
  }
  return pelajaranModelEdit.durationReminder;
});

///* END Form Pelajaran

///* For Form Tugas
final TugasSelectedTime = StateProvider.autoDispose<TimeOfDay>((ref) {
  final tugasModelEdit = ref.watch(TugasModelEdit).state;
  if (tugasModelEdit.idTugas == null) {
    return TimeOfDay.now();
  } else {
    return TimeOfDay.fromDateTime(tugasModelEdit.deadlineTugas);
  }
});

final TugasSelectedDate = StateProvider.autoDispose<DateTime>((ref) {
  final tugasModelEdit = ref.watch(TugasModelEdit).state;
  if (tugasModelEdit.idTugas == null) {
    return DateTime.now();
  } else {
    return tugasModelEdit.deadlineTugas;
  }
});

final TugasDropdownPelajaran = StateProvider.autoDispose<PelajaranModel>((ref) {
  final tugasModelEdit = ref.watch(TugasModelEdit).state;
  if (tugasModelEdit.idTugas == null) {
    return null;
  } else {
    return tugasModelEdit.pelajaran;
  }
});

final TugasReminderType = StateProvider.autoDispose<ReminderModel>((ref) {
  final tugasModelEdit = ref.watch(TugasModelEdit).state;

  if (tugasModelEdit.idTugas == null) {
    return null;
  } else {
    return tugasModelEdit.reminderModel;
  }
});

final TugasReminderValue = StateProvider.autoDispose<int>((ref) {
  final tugasModelEdit = ref.watch(TugasModelEdit).state;
  if (tugasModelEdit.idTugas == null) {
    return 0;
  }
  return tugasModelEdit.durationReminder;
});

///* END Form Tugas

///* Model Edit
final TugasModelEdit = StateProvider<TugasModel>((ref) => TugasModel());
final PelajaranModelEdit = StateProvider<PelajaranModel>((ref) => PelajaranModel());
final DosenModelEdit = StateProvider<DosenModel>((ref) => DosenModel());

///* END Model Edit
///
///* TaskScreen

///* DateTime only Y-M-D formatted , not include H:M:I
final GlobalDateNowYMD = StateProvider.autoDispose<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
});
final Global7NextDayYMD = StateProvider.autoDispose<DateTime>((ref) {
  final next7Day = ref.watch(GlobalDateNowYMD).state;
  return DateTime(next7Day.year, next7Day.month, next7Day.day).add(Duration(days: 7));
});

///* Home Screen
final GlobalIndexPageView = StateProvider.autoDispose<int>((ref) => 0);

///* Setting Screen [Progress Import & Export]
final GlobalProgressImport = StateProvider.autoDispose<int>((ref) => 0);
final GlobalProgressExport = StateProvider<int>((ref) => 0);

///* For Identified is for Form Pelajaran/Tugas
final GlobalFormType = StateProvider<FormType>((ref) => FormType.IsFormTugas);

///! Imporant should have
///* Global Context for Navigator.pop
final GlobalContext = StateProvider<BuildContext>((ref) => null);

///! Imporant should have
///* For Loading , Usefull prevent multiple click onpressed
final GlobalLoadingBuilder = StateProvider.autoDispose<bool>((ref) => false);

///* For checking is darkmode or not
final GlobalIsDarkMode = StateProvider<bool>((ref) => false);

///* ID for parsing between widget

final IDDosen = StateProvider<int>((ref) => 0);
final IDPelajaran = StateProvider<int>((ref) => 0);
final IDTugas = StateProvider<int>((ref) => 0);

///* End ID For parsing
