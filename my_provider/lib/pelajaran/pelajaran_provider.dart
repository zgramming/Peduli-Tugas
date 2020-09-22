import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:my_network/my_network.dart';

import '../my_provider.dart';

final DBHelper _db = DBHelper();

class PelajaranProvider extends StateNotifier<List<PelajaranModel>> {
  PelajaranProvider([List<PelajaranModel> state]) : super(state ?? []);

  Future<List<PelajaranModel>> showPelajaran() async {
    final result = await _db.showPelajaran();
    addItemIfNotExist(result);
    return result;
  }

  Future<int> insertPelajaran(
    PelajaranModel model, {
    void Function(int uniqueIDNotification, int lastId) onSuccessInsert,
  }) async {
    var tempPelajaran = PelajaranModel(
      idPelajaran: await _db.getLastId(TableSQL.TablePelajaran),
      dosen: model.dosen,
      namePelajaran: model.namePelajaran,
      semester: model.semester,
      hari: model.hari,
      durationReminder: model.durationReminder,
      reminderModel: model.reminderModel,
      waktuPelajaran: model.waktuPelajaran,
    );
    final result = await _db.insertPelajaran(
      namePelajaran: tempPelajaran.namePelajaran,
      dosen: tempPelajaran.dosen,
      semester: tempPelajaran.semester,
      selectedDay: tempPelajaran.hari,
      durationReminder: tempPelajaran.durationReminder,
      reminderModel: tempPelajaran.reminderModel,
      waktuPelajaran: tempPelajaran.waktuPelajaran,
    );
    print('tempPelajaran $tempPelajaran');
    addItemIfNotExist(tempPelajaran, typeValue: TypeValue.Object);
    if (onSuccessInsert != null) {
      onSuccessInsert(
        tempPelajaran.waktuPelajaran.millisecondsSinceEpoch ~/ 1000,
        tempPelajaran.idPelajaran,
      );
    }
    return result;
  }

  Future<int> deletePelajaran(int idPelajaran) async {
    var tempList = state;
    final result = await _db.deletePelajaran(idPelajaran);
    tempList.removeWhere((element) => element.idPelajaran == idPelajaran);
    state = tempList;
    return result;
  }

  void deletePelajaranByDosen(int idDosen) {
    var tempList = state;
    tempList.removeWhere((element) => element.dosen.idDosen == idDosen);
    state = tempList;
  }

  Future<int> updatePelajaran(
    PelajaranModel model, {
    void Function(int uniqueIDNotification) onSuccessUpdate,
  }) async {
    final result = await _db.updatePelajaran(
      idPelajaran: model.idPelajaran,
      semester: model.semester,
      dosen: model.dosen,
      hari: model.hari,
      namePelajaran: model.namePelajaran,
      durationReminder: model.durationReminder,
      reminderModel: model.reminderModel,
      waktuPelajaran: model.waktuPelajaran,
    );
    state = [
      for (var item in state)
        if (item.idPelajaran == model.idPelajaran) model else item
    ];
    if (onSuccessUpdate != null) {
      onSuccessUpdate(model.waktuPelajaran.millisecondsSinceEpoch ~/ 1000);
    }

    return result;
  }

  Future<void> importPelajaran(PelajaranModel model) async {
    await _db.importPelajaran(
      TableSQL.TablePelajaran,
      idPelajaran: model.idPelajaran,
      namePelajaran: model.namePelajaran,
      dosen: model.dosen,
      selectedDay: model.hari,
      semester: model.semester,
      durationReminder: model.durationReminder,
      reminderModel: model.reminderModel,
      waktuPelajaran: model.waktuPelajaran,
    );
    addItemIfNotExist(model, typeValue: TypeValue.Object);
  }

  void addItemIfNotExist(dynamic data, {TypeValue typeValue = TypeValue.List}) {
    var tempList = <PelajaranModel>[];
    if (data == null) {
      // print('your data null on method addItemIfNotExist');
      return null;
    } else {
      if (typeValue == TypeValue.List) {
        // print('type List');
        for (PelajaranModel newItem in data) {
          final existItem = state.firstWhere(
            (element) => element.idPelajaran == newItem.idPelajaran,
            orElse: () => null,
          );
          if (existItem == null) {
            // print('data List not exist , add it now !');
            tempList.add(newItem);
          }
        }
      } else {
        // print('type Object');
        final PelajaranModel newItem = data;
        final existItem = state.firstWhere((element) => element.idPelajaran == newItem.idPelajaran,
            orElse: () => null);
        if (existItem == null) {
          // print('data Object not exist , add it now !');
          tempList.add(newItem);
        }
      }
    }
    state = [...state, ...tempList];
    state.sort((a, b) => -a.semester.idSemester.compareTo(b.semester.idSemester));
  }
}

final pelajaranProvider = StateNotifierProvider((ref) => PelajaranProvider());

final showAllPelajaran = FutureProvider.autoDispose((ref) async {
  final pelajaran = ref.watch(pelajaranProvider);
  final result = await pelajaran.showPelajaran();
  return result;
});

final totalAllPelajaran = FutureProvider.autoDispose((ref) async {
  final result = await _db.getCount(TableSQL.TablePelajaran);
  return result;
});

final showPelajaranById = Provider.autoDispose.family((ref, idPelajaran) {
  final pelajaran = ref.watch(pelajaranProvider.state);
  final result =
      pelajaran.firstWhere((element) => element.idPelajaran == idPelajaran, orElse: () => null);
  return result;
});

final showPelajaranBySemester =
    Provider.autoDispose.family<List<PelajaranModel>, int>((ref, idSemester) {
  final pelajaran = ref.watch(pelajaranProvider.state);
  final result = pelajaran.where((element) => element.semester.idSemester == idSemester).toList();
  result.sort((a, b) => a.namePelajaran.toLowerCase().compareTo(b.namePelajaran.toLowerCase()));
  return result;
});

final showPelajaranByDosen = Provider.autoDispose.family<List<PelajaranModel>, int>((ref, idDosen) {
  final pelajaran = ref.watch(pelajaranProvider.state);
  final result = pelajaran.where((element) => element.dosen.idDosen == idDosen).toList();
  result.sort((a, b) => a.namePelajaran.toLowerCase().compareTo(b.namePelajaran.toLowerCase()));
  return result;
});

final totalPelajaranByDosen = Provider.autoDispose.family<int, int>((ref, param) {
  final pelajaran = ref.watch(pelajaranProvider.state);
  final result = pelajaran.where((element) => element.dosen.idDosen == param).toList();
  return result.length;
});

///* Grouping pelajaran berdasarkan dosen + semesternya
final groupedPelajaranByDosenBySemester =
    Provider.autoDispose.family<Map<String, List<PelajaranModel>>, int>((ref, param) {
  var tempMap = <String, List<PelajaranModel>>{};
  final pelajaran = ref.watch(showPelajaranByDosen(param));
  for (var item in pelajaran) {
    var original = tempMap[item.semester.nameSemester];
    if (original == null) {
      tempMap[item.semester.nameSemester] = [];
    }
    tempMap[item.semester.nameSemester].add(item);
  }
  return tempMap;
});
