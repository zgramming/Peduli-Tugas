import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:my_network/my_network.dart';

import '../my_provider.dart';

final DBHelper _db = DBHelper();

class DosenProvider extends StateNotifier<List<DosenModel>> {
  DosenProvider([List<DosenModel> state]) : super(state ?? []);

  Future<List<DosenModel>> showDosen() async {
    final result = await _db.showDosen();
    addItemIfNotExist(result);
    return result;
  }

  Future<int> insertDosen(DosenModel model) async {
    final tempModel = model.copyWith(idDosen: await _db.getLastId(TableSQL.TableDosen));
    print('model Dosen $tempModel');
    final result = await _db.insertDosen(tempModel);
    addItemIfNotExist(tempModel, typeValue: TypeValue.Object);
    return result;
  }

  Future<int> deleteDosen(int idDosen) async {
    var tempList = state;
    tempList.removeWhere((element) => element.idDosen == idDosen);
    final result = await _db.deleteDosen(idDosen);
    state = tempList;
    return result;
  }

  Future<void> importDosen(DosenModel model) async {
    await _db.importDosen(model, tableSQL: TableSQL.TableDosen);
    addItemIfNotExist(model, typeValue: TypeValue.Object);
  }

  Future<int> updateDosen(DosenModel model) async {
    final result = await _db.updateDosen(model);

    state = [
      for (var item in state)
        if (item.idDosen == model.idDosen) model else item
    ];
    return result;
  }

  void addItemIfNotExist(dynamic data, {TypeValue typeValue = TypeValue.List}) {
    var tempList = <DosenModel>[];
    if (data == null) {
      return null;
    } else {
      if (typeValue == TypeValue.List) {
        for (DosenModel newItem in data) {
          final existItem = state.firstWhere(
            (element) => element.idDosen == newItem.idDosen,
            orElse: () => null,
          );
          if (existItem == null) {
            tempList.add(newItem);
          }
        }
      } else {
        final DosenModel newItem = data;
        final existItem =
            state.firstWhere((element) => element.idDosen == newItem.idDosen, orElse: () => null);
        if (existItem == null) {
          tempList.add(newItem);
        }
      }
    }
    state = [...state, ...tempList];
  }
}

final dosenProvider = StateNotifierProvider((ref) => DosenProvider());

final showAllDosen = FutureProvider.autoDispose((ref) async {
  final dosen = ref.watch(dosenProvider);
  final result = await dosen.showDosen();
  return result;
});

// final deleteDosen = FutureProvider.autoDispose.family<void, int>((ref, idDosen) async {
//   final dosen = ref.watch(dosenProvider);
//   final pelajaran = ref.watch(pelajaranProvider);
//   final pelajaranByDosen = ref.watch(showPelajaranByDosen(idDosen));
//   final tugas = ref.watch(tugasProvider);

//   await dosen.deleteDosen(idDosen);
//   await pelajaran.deletePelajaranByDosen(idDosen);
//   for (var item in pelajaranByDosen) {
//     await tugas.deleteTugasByPelajaran(item.idPelajaran);
//   }
// });

final totalAllDosen = FutureProvider.autoDispose((ref) async {
  final result = await _db.getCount(TableSQL.TableDosen);
  return result;
});

final showDosenByid = Provider.autoDispose.family<DosenModel, int>((ref, idDosen) {
  final dosen = ref.watch(dosenProvider.state);
  final result = dosen.firstWhere((element) => element.idDosen == idDosen, orElse: () => null);
  if (result == null) {
    return null;
  }
  return result;
});

final groupedDosen = Provider<Map<String, List<DosenModel>>>((ref) {
  var tempMap = <String, List<DosenModel>>{};
  final dosen = ref.watch(dosenProvider.state);
  dosen.sort((a, b) => a.nameDosen.toLowerCase().compareTo(b.nameDosen.toLowerCase()));
  for (var item in dosen) {
    final nameLowerCase = item.nameDosen[0].toLowerCase();
    var original = tempMap[nameLowerCase];
    if (original == null) {
      tempMap[nameLowerCase] = [];
    }
    tempMap[nameLowerCase].add(item);
  }
  return tempMap;
});

final limitedDosen = Provider.autoDispose<List<DosenModel>>((ref) {
  final dosen = ref.watch(dosenProvider.state);

  if (dosen == null || dosen.isEmpty) {
    return null;
  }
  dosen.sort((a, b) => a.nameDosen.toLowerCase().compareTo(b.nameDosen.toLowerCase()));
  if (dosen.length <= 5) {
    return dosen;
  }
  final result = dosen.take(5).toList();
  return result;
});
