import './sqflite_helper.dart';

import '../my_network.dart';

class SQFliteUtils {
  final db = DBHelper();

  static List<HariModel> _getHariById(List<String> value) {
    if (value == null) {
      return null;
    }
    var convertValue = value.map(int.parse).toList();
    var tempList = <HariModel>[];
    for (var day in convertValue) {
      final isExist = listHari.firstWhere(
        (element) => element.idDay == day,
        orElse: () => null,
      );
      if (isExist != null) {
        tempList.add(isExist);
      }
    }
    return tempList;
  }

  static SemesterModel _getSemesterById(int id) {
    if (id == null) {
      return null;
    }
    final semester = listSemester.firstWhere((element) => element.idSemester == id);
    return semester;
  }

  static ReminderModel _getReminderById(int id) {
    if (id == null) {
      return null;
    }
    final reminder = listReminder.firstWhere((element) => element.id == id);
    return reminder;
  }

  static Future<PelajaranModel> _getPelajaranById(int id) async {
    var db = await SQFliteUtils().db.database();
    var where = 'id_pelajaran = ?';
    var whereArgs = [id];
    final query = await db.query(DBHelper.tablePelajaran, where: where, whereArgs: whereArgs);
    if (query == null || query.isEmpty) {
      return null;
    }
    final List<PelajaranModel> result =
        await SQFliteUtils.convertFromSQFlite(query, table: TableSQL.TablePelajaran);

    return result.first;
  }

  static Future<DosenModel> _getDosenById(int id) async {
    final db = await SQFliteUtils().db.database();
    final where = 'id_dosen = ?';
    final whereArgs = [id];
    final query = await db.query(DBHelper.tableDosen, where: where, whereArgs: whereArgs);
    if (query.isEmpty) {
      return null;
    }
    final result = query.map((e) => DosenModel.fromJson(e)).toList();
    return result.first;
  }

  static Future convertFromSQFlite(
    List<Map<String, dynamic>> listSQL, {
    TableSQL table = TableSQL.TablePelajaran,
  }) async {
    var tempList = [];
    switch (table) {
      case TableSQL.TablePelajaran:
        for (var i in listSQL) {
          final listHari = ((i['hari'] as String).split('-'));
          var tempModel = PelajaranModel(
            idPelajaran: i['id_pelajaran'],
            dosen: await SQFliteUtils._getDosenById(i['dosen']),
            hari: SQFliteUtils._getHariById(listHari),
            namePelajaran: i['name_pelajaran'],
            semester: SQFliteUtils._getSemesterById(i['semester']),
            waktuPelajaran: DateTime.fromMillisecondsSinceEpoch(i['waktu_pelajaran']),
            durationReminder: i['duration_reminder'],
            reminderModel: SQFliteUtils._getReminderById(i['type_reminder']),
          );
          tempList.add(tempModel);
        }
        return tempList.cast<PelajaranModel>();
        break;
      case TableSQL.TableTugas:
        for (var i in listSQL) {
          var tempModel = TugasModel(
            idTugas: i['id_tugas'],
            nameTugas: i['name_tugas'],
            deadlineTugas: DateTime.fromMillisecondsSinceEpoch(i['deadline_tugas']),
            statusTugas: (i['status_tugas'] == 0 ? false : true),
            deskripsiTugas: i['deskripsi_tugas'],
            pelajaran: await SQFliteUtils._getPelajaranById(i['pelajaran']),
            durationReminder: i['duration_reminder'],
            reminderModel: SQFliteUtils._getReminderById(i['type_reminder']),
          );
          tempList.add(tempModel);
        }
        return tempList.cast<TugasModel>();
        break;
      case TableSQL.TableDosen:
        return tempList = [];
        break;
      case TableSQL.TableMahasiswa:
        return tempList = [];
        break;
      default:
        return tempList = [];
        break;
    }
  }
}
