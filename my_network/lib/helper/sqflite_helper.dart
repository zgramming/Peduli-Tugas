import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import '../my_network.dart';
import './sqflite_utils.dart';

enum TableSQL { TableTugas, TableDosen, TableMahasiswa, TablePelajaran }

class DBHelper {
  static const tableDosen = 'tbl_dosen';
  static const tablePelajaran = 'tbl_pelajaran';
  static const tableTugas = 'tbl_tugas';
  static const tableMahasiswa = 'tbl_mahasiswa';

  /// Let's use FOREIGN KEY constraints
  Future _onConfigure(sql.Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbPath, 'peduli_tugas.db'),
      onCreate: _onCreate,
      onConfigure: _onConfigure,
      version: 1,
    );
  }

  void _createTableForApplication(sql.Batch batch) {
    final sqlTableDosen = '''
    CREATE TABLE tbl_dosen(
      id_dosen INTEGER PRIMARY KEY AUTOINCREMENT,
      name_dosen TEXT,
      image_dosen TEXT,
      email_dosen TEXT,
      telp_dosen TEXT)
    ''';

    final sqlTableMahasiswa = '''
    CREATE TABLE tbl_mahasiswa(
      id_mahasiswa INTEGER PRIMARY KEY AUTOINCREMENT,
      name_mahasiswa TEXT,
      email_mahasiswa TEXT,
      telp_mahasiswa TEXT)
    ''';

    final sqlTablePelajaran = '''
    CREATE TABLE tbl_pelajaran(
      id_pelajaran INTEGER PRIMARY KEY AUTOINCREMENT,
      name_pelajaran TEXT,
      semester INTEGER,
      hari TEXT,
      dosen INTEGER,
      waktu_pelajaran,
      type_reminder INTEGER,
      duration_reminder INTEGER,
      FOREIGN KEY (dosen) REFERENCES tbl_dosen(id_dosen) ON DELETE CASCADE)
    ''';

    final sqlTableTugas = '''
    CREATE TABLE tbl_tugas(
      id_tugas INTEGER PRIMARY KEY AUTOINCREMENT,
      name_tugas TEXT,
      deadline_tugas INTEGER,
      status_tugas INTEGER,
      pelajaran INTEGER,
      deskripsi_tugas TEXT,
      type_reminder INTEGER,
      duration_reminder INTEGER,
      FOREIGN KEY (pelajaran) REFERENCES tbl_pelajaran(id_pelajaran) ON DELETE CASCADE)
    ''';
    batch.execute('DROP TABLE IF EXISTS $tableDosen');
    batch.execute(sqlTableDosen);
    batch.execute('DROP TABLE IF EXISTS $tableMahasiswa');
    batch.execute(sqlTableMahasiswa);
    batch.execute('DROP TABLE IF EXISTS $tablePelajaran');
    batch.execute(sqlTablePelajaran);
    batch.execute('DROP TABLE IF EXISTS $tableTugas');
    batch.execute(sqlTableTugas);
  }

  void _onCreate(sql.Database db, int version) async {
    var batch = db.batch();
    _createTableForApplication(batch);
    await batch.commit();
  }

  Future<int> getLastId(TableSQL table) async {
    var tempId = 0;
    var tempList = [];
    try {
      final db = await database();
      switch (table) {
        case TableSQL.TableDosen:
          tempList =
              await db.rawQuery('SELECT id_dosen FROM $tableDosen ORDER BY id_dosen DESC LIMIT 1 ');
          break;
        case TableSQL.TablePelajaran:
          tempList = await db.rawQuery(
              'SELECT id_pelajaran FROM $tablePelajaran ORDER BY id_pelajaran DESC LIMIT 1 ');
          break;
        case TableSQL.TableTugas:
          tempList =
              await db.rawQuery('SELECT id_tugas FROM $tableTugas ORDER BY id_tugas DESC LIMIT 1 ');
          break;
        default:
          tempList = await db.rawQuery('SELECT * FROM $tableMahasiswa');
      }
      if (tempList == null || tempList.isEmpty) {
        return tempId + 1;
      }
      if (table == TableSQL.TablePelajaran) {
        tempId = tempList.last['id_pelajaran'];
      } else if (table == TableSQL.TableTugas) {
        tempId = tempList.last['id_tugas'];
      } else if (table == TableSQL.TableDosen) {
        tempId = tempList.last['id_dosen'];
      } else {
        tempId = tempList.last['id_mahasiswa'];
      }
      return tempId + 1;
    } catch (e) {
      rethrow;
    }
  }

  ///* Dosen

  Future<int> insertDosen(DosenModel model) async {
    final db = await database();
    final result = await db.insert(
      tableDosen,
      model.toJson(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    print('insert dosen $result');
    return result;
  }

  Future<List<DosenModel>> showDosen() async {
    final db = await database();
    final orderBy = 'name_dosen DESC';
    final result = await db.query(tableDosen, orderBy: orderBy);

    final listDosen = result.map((e) => DosenModel.fromJson(e)).toList();
    return listDosen;
  }

  Future<int> deleteDosen(int idDosen) async {
    final db = await database();
    final where = 'id_dosen = ?';
    final whereArgs = [idDosen];
    final deleteDosen = await db.delete(tableDosen, where: where, whereArgs: whereArgs);
    print('delete Dosen $deleteDosen');
    if (deleteDosen == 0) {
      return null;
    }
    // await _deletePelajaranByDosen(idDosen);

    // final countDosen = await getCount(tableDosen);
    // final countPelajaran = await getCount(tablePelajaran);
    // final countTugas = await getCount(tableTugas);
    // print(
    //     'after delete count : dosen=$countDosen || pelajaran=$countPelajaran || tugas=$countTugas');

    return deleteDosen;
  }

  Future<int> updateDosen(DosenModel model) async {
    final db = await database();
    final where = 'id_dosen = ?';
    final whereArgs = [model.idDosen];
    final result = await db.update(tableDosen, model.toJson(), where: where, whereArgs: whereArgs);
    print('update dosen $result');
    return result;
  }

  ///* End Dosen

  ///* Pelajaran
  Future<int> insertPelajaran({
    @required String namePelajaran,
    @required SemesterModel semester,
    @required DosenModel dosen,
    @required List<HariModel> selectedDay,
    @required DateTime waktuPelajaran,
    @required ReminderModel reminderModel,
    @required int durationReminder,
  }) async {
    var tempListDay = <int>[];
    for (var day in selectedDay) {
      tempListDay.add(day.idDay);
    }
    final db = await database();
    final idReminder = reminderModel == null ? 0 : reminderModel.id;

    final result = await db.rawInsert(
      'INSERT INTO $tablePelajaran (name_pelajaran,semester,hari,dosen,waktu_pelajaran,type_reminder,duration_reminder) VALUES(?,?,?,?,?,?,?)',
      [
        namePelajaran,
        semester.idSemester,
        tempListDay.join('-'),
        dosen.idDosen,
        waktuPelajaran.millisecondsSinceEpoch,
        idReminder,
        durationReminder,
      ],
    );

    print('insert pelajaran $result');
    return result;
  }

  Future<List<PelajaranModel>> showPelajaran() async {
    final db = await database();
    final orderBy = 'name_pelajaran DESC';
    final result = await db.query(tablePelajaran, orderBy: orderBy);
    final List<PelajaranModel> convertResult = await SQFliteUtils.convertFromSQFlite(result);

    return convertResult;
  }

  Future<int> deletePelajaran(int idPelajaran) async {
    final db = await database();
    final where = 'id_pelajaran = ? ';
    final whereArgs = [idPelajaran];
    final resultPelajaran = await db.delete(tablePelajaran, where: where, whereArgs: whereArgs);
    print('result delete Pelajaran $resultPelajaran');
    // if (resultPelajaran != 0) {
    //   print('proses hapus tugas berdasarkan pelajaran');
    //   await _deleteTugasByPelajaran(idPelajaran);
    // }

    return resultPelajaran;
  }

  // Future<int> _deletePelajaranByDosen(int idDosen) async {
  //   final db = await database();
  //   final where = 'dosen = ? ';
  //   final whereArgs = [idDosen];
  //   final pelajaranByDosen = await db.query(tablePelajaran, where: where, whereArgs: whereArgs);
  //   if (pelajaranByDosen == null || pelajaranByDosen.isEmpty) {
  //     print('pelajaranbydosen tidak ditemukan , operasi hapus tidak dilanjutkan');
  //     return null;
  //   } else {
  //     final deletePelajaran = await db.delete(tablePelajaran, where: where, whereArgs: whereArgs);
  //     print('result delete PelajaranByDosen $deletePelajaran');

  //     final List<PelajaranModel> convertPelajaranByDosen =
  //         await SQFliteUtils.convertFromSQFlite(pelajaranByDosen);
  //     print('convertPelajaranByDosen ${convertPelajaranByDosen.length}');
  //     for (var plj in convertPelajaranByDosen) {
  //       await _deleteTugasByPelajaran(plj.idPelajaran);
  //     }
  //     return deletePelajaran;
  //   }
  // }

  Future<int> updatePelajaran({
    @required int idPelajaran,
    @required SemesterModel semester,
    @required DosenModel dosen,
    @required List<HariModel> hari,
    @required String namePelajaran,
    @required DateTime waktuPelajaran,
    @required ReminderModel reminderModel,
    @required int durationReminder,
  }) async {
    var tempListDay = <int>[];
    for (var day in hari) {
      tempListDay.add(day.idDay);
    }
    final db = await database();
    final idReminder = reminderModel == null ? 0 : reminderModel.id;
    final result = await db.rawUpdate(
      'UPDATE $tablePelajaran SET name_pelajaran = ? ,semester = ? , dosen = ? ,hari = ?,waktu_pelajaran=? , type_reminder = ? , duration_reminder = ? WHERE id_pelajaran= ?',
      [
        namePelajaran,
        semester.idSemester,
        dosen.idDosen,
        tempListDay.join('-'),
        waktuPelajaran.millisecondsSinceEpoch,
        idReminder,
        durationReminder,
        idPelajaran,
      ],
    );
    print('update pelajaran $result');
    return result;
  }

  ///* End Pelajaran

  ///* Tugas
  Future<List<TugasModel>> showTugas() async {
    final db = await database();
    final orderBy = 'name_tugas DESC';
    final result = await db.query(tableTugas, orderBy: orderBy);
    // print('result showTugas() $result');
    final List<TugasModel> convertResult =
        await SQFliteUtils.convertFromSQFlite(result, table: TableSQL.TableTugas);
    // print('Convert Show Tugas $convertResult');
    return convertResult;
  }

  Future<int> insertTugas({
    @required String nameTugas,
    @required DateTime deadlineTugas,
    @required PelajaranModel pelajaran,
    @required String deskripsiTugas,
    @required ReminderModel reminderModel,
    @required int durationReminder,
    @required int idTugas,
  }) async {
    final db = await database();
    final lastId = getLastId(TableSQL.TableTugas);
    print('SQL lastId ${await lastId}');
    final idReminder = reminderModel == null ? 0 : reminderModel.id;
    final result = await db.rawInsert(
      '''
      INSERT INTO $tableTugas 
      (id_tugas,name_tugas,deadline_tugas,status_tugas,pelajaran,deskripsi_tugas,type_reminder,duration_reminder)
       VALUES (?,?,?,?,?,?,?,?)
      ''',
      // 'INSERT INTO $tableTugas SET id_tugas = ?, name_tugas = ? ,deadline_tugas=?,status_tugas=?,pelajaran=?,deskripsi_tugas=?,type_reminder=?,duration_reminder=? ',
      [
        idTugas,
        nameTugas,
        deadlineTugas.millisecondsSinceEpoch,
        0,
        pelajaran.idPelajaran,
        deskripsiTugas,
        idReminder,
        durationReminder,
      ],
    );
    // print('insert tugas $result');
    return result;
  }

  Future<int> updateStatusTugas(int statusTugas, int idTugas) async {
    final db = await database();
    final result = await db.rawUpdate(
      'UPDATE $tableTugas SET status_tugas = ? WHERE id_tugas = ?',
      [
        statusTugas,
        idTugas,
      ],
    );
    print('update tugas $result');
    return result;
  }

  Future<int> updateTugas({
    @required String nameTugas,
    @required DateTime deadlineTugas,
    @required PelajaranModel pelajaran,
    @required String deskripsiTugas,
    @required ReminderModel reminderModel,
    @required int durationReminder,
    @required int idTugas,
  }) async {
    final db = await database();
    final idReminder = reminderModel == null ? 0 : reminderModel.id;
    final result = await db.rawUpdate(
      'UPDATE $tableTugas SET name_tugas = ? , deadline_tugas = ? , pelajaran = ? , deskripsi_tugas = ? ,type_reminder = ? , duration_reminder = ? WHERE id_tugas = ?',
      [
        nameTugas,
        deadlineTugas.millisecondsSinceEpoch,
        pelajaran.idPelajaran,
        deskripsiTugas,
        idReminder,
        durationReminder,
        idTugas,
      ],
    );
    print('update tugas SQFlite $result');
    return result;
  }

  Future<int> deleteTugas(int idTugas) async {
    final db = await database();
    final where = 'id_tugas = ?';
    final whereArgs = [idTugas];
    final result = await db.delete(tableTugas, where: where, whereArgs: whereArgs);
    print('delete tugas $result');
    return result;
  }

  // Future<int> _deleteTugasByPelajaran(int idPelajaran) async {
  //   final db = await database();
  //   final whereTugas = 'pelajaran = ?';
  //   final whereArgsTugas = [idPelajaran];
  //   final resultTugas = await db.delete(tableTugas, where: whereTugas, whereArgs: whereArgsTugas);
  //   print('delete tugasbypelajaran $resultTugas');
  //   return resultTugas;
  // }

  ///* End Tugas
  ///* Import Execution
  Future<void> importDosen(
    DosenModel model, {
    @required TableSQL tableSQL,
  }) async {
    final count = await getCount(tableSQL, idValue: model.idDosen);
    if (count != 0) {
      await updateDosen(model);
    } else {
      await insertDosen(model);
    }
  }

  Future<void> importPelajaran(
    TableSQL tableSQL, {
    @required int idPelajaran,
    @required String namePelajaran,
    @required SemesterModel semester,
    @required DosenModel dosen,
    @required List<HariModel> selectedDay,
    @required DateTime waktuPelajaran,
    @required ReminderModel reminderModel,
    @required int durationReminder,
  }) async {
    final count = await getCount(tableSQL, idValue: idPelajaran);
    if (count != 0) {
      await updatePelajaran(
        dosen: dosen,
        hari: selectedDay,
        idPelajaran: idPelajaran,
        namePelajaran: namePelajaran,
        semester: semester,
        durationReminder: durationReminder,
        reminderModel: reminderModel,
        waktuPelajaran: waktuPelajaran,
      );
    } else {
      await insertPelajaran(
        semester: semester,
        dosen: dosen,
        namePelajaran: namePelajaran,
        selectedDay: selectedDay,
        durationReminder: durationReminder,
        reminderModel: reminderModel,
        waktuPelajaran: waktuPelajaran,
      );
    }
  }

  Future<void> importTugas(
    TableSQL tableSQL, {
    @required int idTugas,
    @required String nameTugas,
    @required DateTime deadlineTugas,
    @required PelajaranModel pelajaran,
    @required String deskripsiTugas,
    @required int durationReminder,
    @required ReminderModel reminderModel,
  }) async {
    final count = await getCount(tableSQL, idValue: idTugas);
    if (count != 0) {
      print('importTugas Masuk Update');
      await updateTugas(
        nameTugas: nameTugas,
        deadlineTugas: deadlineTugas,
        pelajaran: pelajaran,
        deskripsiTugas: deskripsiTugas,
        durationReminder: durationReminder,
        reminderModel: reminderModel,
        idTugas: idTugas,
      );
    } else {
      print('importTugas Masuk Insert');
      await insertTugas(
        idTugas: idTugas,
        nameTugas: nameTugas,
        deadlineTugas: deadlineTugas,
        pelajaran: pelajaran,
        deskripsiTugas: deskripsiTugas,
        durationReminder: durationReminder,
        reminderModel: reminderModel,
      );
    }
  }

  /// End Import Execution
  ///* For Testing Count Dosen , Pelajaran and Tugas
  Future<int> getCount(TableSQL tableSQL, {int idValue}) async {
    String id;
    String table;
    switch (tableSQL) {
      case TableSQL.TableDosen:
        id = 'id_dosen';
        table = tableDosen;
        break;
      case TableSQL.TablePelajaran:
        id = 'id_pelajaran';
        table = tablePelajaran;
        break;
      case TableSQL.TableTugas:
        id = 'id_tugas';
        table = tableTugas;
        break;
      default:
        break;
    }
    final db = await database();
    int count;
    if (idValue != null) {
      count = sql.Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT($id) FROM $table WHERE $id= ?', [idValue]),
      );
    } else {
      count = sql.Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT($id) FROM $table'));
    }
    return count;
  }

  ///* End Testing
}
