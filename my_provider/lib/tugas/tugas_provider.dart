import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';

DBHelper _db = DBHelper();

class TugasProvider extends StateNotifier<List<TugasModel>> {
  TugasProvider() : super([]);
  DBHelper db = DBHelper();

  Future<List<TugasModel>> showTugas() async {
    final result = await db.showTugas();
    addItemIfNotExist(result);
    return result;
  }

  Future<int> insertTugas({
    @required TugasModel model,
    void Function(int uniqueIDNotification, int lastId) onSuccessInsert,
  }) async {
    var tempModel = model.copyWith(idTugas: await db.getLastId(TableSQL.TableTugas));
    // print('insertTugas ${tempModel.idTugas}');
    final result = await db.insertTugas(
      idTugas: tempModel.idTugas,
      nameTugas: tempModel.nameTugas,
      deadlineTugas: tempModel.deadlineTugas,
      pelajaran: tempModel.pelajaran,
      deskripsiTugas: tempModel.deskripsiTugas,
      durationReminder: tempModel.durationReminder,
      reminderModel: tempModel.reminderModel,
    );

    // print('tempModel $tempModel');
    addItemIfNotExist(tempModel, typeValue: TypeValue.Object);
    if (onSuccessInsert != null) {
      onSuccessInsert(
        tempModel.deadlineTugas.millisecondsSinceEpoch ~/ 1000,
        tempModel.idTugas,
      );
    }
    return result;
  }

  Future<int> updateStatusTugas(bool statusTugas, int idTugas) async {
    var tempStatus = statusTugas ? 1 : 0;
    final result = await db.updateStatusTugas(tempStatus, idTugas);
    state = [
      for (var item in state)
        if (item.idTugas == idTugas) item.copyWith(statusTugas: statusTugas) else item
    ];
    return result;
  }

  Future<int> updateTugas(
    TugasModel model, {
    void Function(int uniqueIDNotification) onSuccessUpdate,
  }) async {
    final result = await db.updateTugas(
      nameTugas: model.nameTugas,
      deadlineTugas: model.deadlineTugas,
      pelajaran: model.pelajaran,
      deskripsiTugas: model.deskripsiTugas,
      durationReminder: model.durationReminder,
      reminderModel: model.reminderModel,
      idTugas: model.idTugas,
    );
    state = [
      for (var item in state)
        if (item.idTugas == model.idTugas) model else item
    ];
    if (onSuccessUpdate != null) {
      onSuccessUpdate(model.deadlineTugas.millisecondsSinceEpoch ~/ 1000);
    }
    return result;
  }

  Future<int> deleteTugas(int idTugas) async {
    final result = await db.deleteTugas(idTugas);
    var tempList = state;
    tempList.removeWhere((element) => element.idTugas == idTugas);
    state = tempList;
    return result;
  }

  void deleteTugasByPelajaran(int idPelajaran) {
    var tempList = state;
    tempList.removeWhere((element) => element.pelajaran.idPelajaran == idPelajaran);
    state = tempList;
  }

  Future<void> importTugas(TugasModel model) async {
    await db.importTugas(
      TableSQL.TableTugas,
      idTugas: model.idTugas,
      nameTugas: model.nameTugas,
      deadlineTugas: model.deadlineTugas,
      pelajaran: model.pelajaran,
      deskripsiTugas: model.deskripsiTugas,
      durationReminder: model.durationReminder,
      reminderModel: model.reminderModel,
    );
    addItemIfNotExist(model, typeValue: TypeValue.Object);
  }

  void addItemIfNotExist(dynamic data, {TypeValue typeValue = TypeValue.List}) {
    var tempList = <TugasModel>[];
    if (data == null) {
      print('your data null on method addItemIfNotExist');
      return null;
    } else {
      if (typeValue == TypeValue.List) {
        print('type List');
        for (TugasModel newItem in data) {
          final existItem = state.firstWhere(
            (element) => element.idTugas == newItem.idTugas,
            orElse: () => null,
          );
          if (existItem == null) {
            print('data List not exist , add it now !');
            tempList.add(newItem);
          }
        }
      } else {
        print('type Object');
        final TugasModel newItem = data;
        final existItem =
            state.firstWhere((element) => element.idTugas == newItem.idTugas, orElse: () => null);
        if (existItem == null) {
          print('data Object not exist , add it now !');
          tempList.add(newItem);
        }
      }
    }
    state = [...state, ...tempList];
  }
}

final tugasProvider = StateNotifierProvider((ref) => TugasProvider());

final showAllTugas = FutureProvider.autoDispose((ref) async {
  final tugas = ref.watch(tugasProvider);
  final result = await tugas.showTugas();
  return result;
});

final totalAllTugas = FutureProvider.autoDispose((ref) async {
  final result = await _db.getCount(TableSQL.TableTugas);
  return result;
});

final totalTugasProgress = Provider.autoDispose((ref) {
  // final groupedTugas = watch(TPgroupedByDay(false)) as List<TugasModel>;
  final groupedTugas = ref.watch(TPgroupedByDay(false)) as List<TugasModel>;
  if (groupedTugas == null) {
    return null;
  }
  final totalTugasProgress =
      groupedTugas.where((element) => element.statusTugas == false).toList().length;
  // print('totaltugasprogress $totalTugasProgress');
  if (totalTugasProgress == 0) {
    return null;
  }
  return totalTugasProgress;
});

final tugasById = Provider.autoDispose((ref) {
  final id = ref.watch(IDTugas).state;
  // print('provider TugasBYId $id');
  final tugas = ref.watch(tugasProvider.state);
  if (tugas == null || tugas.isEmpty) {
    return null;
  }
  return tugas.firstWhere((element) => element.idTugas == id, orElse: () => null);
});

final groupedTugasByStatus = Provider.autoDispose.family((ref, param) {
  var tempStatus = <bool>[];
  final tugas = ref.watch(tugasProvider.state);
  final result = tugas.where((element) => element.pelajaran.idPelajaran == param);
  for (var tgs in result) {
    tempStatus.add(tgs.statusTugas);
  }
  // print(tempStatus);
  return tempStatus.toSet().toList();
});

final showTugasByPelajaran = Provider.autoDispose.family<List<TugasModel>, int>((ref, param) {
  final tugas = ref.watch(tugasProvider.state);
  final result = tugas.where((element) => element.pelajaran.idPelajaran == param).toList();
  return result;
});

/// Param[0] == IDPelajaran , Param[1]== Status Tugas , Param[2]== Menampilkan Datanya / Total Datanya
final tugasByPelajaranAndStatus = Provider.autoDispose.family((ref, List param) {
  final tugas = ref.watch(tugasProvider.state);
  final result = tugas
      .where(
          (element) => element.pelajaran.idPelajaran == param[0] && element.statusTugas == param[1])
      .toList();
  if (param[2] == 1) {
    return result;
  } else {
    return result.length;
  }
});

final totalTugasByDosen = Provider.autoDispose.family<int, int>((ref, param) {
  final tugas = ref.watch(tugasProvider.state);

  final result = tugas.where((element) => element.pelajaran.dosen.idDosen == param).toList();
  return result.length;
});

final TPbyDeadline =
    Provider.autoDispose.family<Map<PelajaranModel, List<TugasModel>>, DateTime>((ref, deadline) {
  final tugas = ref.watch(TPgroupedByDay(false)) as List<TugasModel>;
  if (tugas == null || tugas.isEmpty) {
    return null;
  }
  var tempMap = <PelajaranModel, List<TugasModel>>{};
  final result = tugas.where((element) {
    final date = DateTime(
      element.deadlineTugas.year,
      element.deadlineTugas.month,
      element.deadlineTugas.day,
    );
    return date == deadline;
  }).toList();

  if (result == null || result.isEmpty) {
    return null;
  }
  for (var item in result) {
    final original = tempMap[item.pelajaran];
    if (original == null) {
      tempMap[item.pelajaran] = [];
    }
    tempMap[item.pelajaran].add(item);
  }
  return tempMap;
});

final TPgroupedByDay = Provider.autoDispose.family<List, bool>((ref, isForTabBar) {
  var tempList = <DateTime>[];
  final tugas = ref.watch(tugasProvider.state);

  final now = ref.watch(GlobalDateNowYMD).state;
  final next7Day = ref.watch(Global7NextDayYMD).state;

  final result = tugas
      .where((element) =>
          element.deadlineTugas.isAfter(now) && element.deadlineTugas.isBefore(next7Day))
      .toList();

  if (result == null || result.isEmpty) {
    return null;
  }
  if (isForTabBar) {
    for (var item in result) {
      tempList.add(
        DateTime(
          item.deadlineTugas.year,
          item.deadlineTugas.month,
          item.deadlineTugas.day,
        ),
      );
    }
    tempList.sort((a, b) => a.compareTo(b));
    final resultDate = tempList.toSet().toList();
    for (var item in resultDate) {
      print(item);
    }
    return resultDate;
  } else {
    return result;
  }
});

final TPbarchart = Provider.autoDispose((ref) {
  var tempList = <BarChartModel>[];
  final dateResult = ref.watch(TPgroupedByDay(true)) as List<DateTime>;
  final tugasResult = ref.watch(TPgroupedByDay(false)) as List<TugasModel>;
  if (dateResult == null || dateResult.isEmpty) {
    return null;
  }
  for (var day in dateResult) {
    final totalTugas = tugasResult
        .where((element) {
          final date = DateTime(
            element.deadlineTugas.year,
            element.deadlineTugas.month,
            element.deadlineTugas.day,
          );
          return date == day;
        })
        .toList()
        .length;

    final totalSelesai = tugasResult
        .where((element) {
          final date = DateTime(
            element.deadlineTugas.year,
            element.deadlineTugas.month,
            element.deadlineTugas.day,
          );
          return date == day && element.statusTugas == true;
        })
        .toList()
        .length;

    tempList.add(BarChartModel(date: day, totalTugas: totalTugas, totalSelesai: totalSelesai));
  }
  return tempList;
});

final TPpiechart = Provider.autoDispose((ref) {
  var tempList = <PieChartModel>[];
  final tugas = ref.watch(tugasProvider.state);
  if (tugas == null || tugas.isEmpty) {
    return null;
  }

  final tugasDone = tugas.where((element) => element.statusTugas == true).toList();
  final tugasProgress = tugas.where((element) => element.statusTugas == false).toList();

  tempList.add(PieChartModel(title: 'Selesai', total: tugasDone.length));
  tempList.add(PieChartModel(title: 'On Progress', total: tugasProgress.length));

  return tempList;
});
