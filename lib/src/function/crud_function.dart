import 'dart:convert';
import 'dart:io';

import 'package:share/share.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_network/my_network.dart';
import 'package:file_picker/file_picker.dart';
import 'package:my_provider/my_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'functions.dart';

class CRUDFunction {
  static const _fileNameBackup = 'peduli_tugas_export.txt';
  static const _filterFileNameBackup = 'peduli_tugas_export';
  static Future<void> addAndUpdateDosen(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    @required TextEditingController nameDosen,
    @required TextEditingController emailDosen,
    @required TextEditingController telpDosen,
  }) async {
    int result;
    var message;
    ToastType toastType;
    final form = formKey.currentState;
    final modelEdit = context.read(DosenModelEdit).state;
    if (form.validate()) {
      try {
        final imageDosen = context.read(DosenBase64Image).state;
        if (imageDosen != null) {
          var model = DosenModel(
            nameDosen: nameDosen.text,
            emailDosen: emailDosen.text,
            telpDosen: telpDosen.text,
            imageDosen: imageDosen,
          );
          print(model);
          if (modelEdit.idDosen != null) {
            // print('masuk edit');
            result = await context
                .read(dosenProvider)
                .updateDosen(model.copyWith(idDosen: modelEdit.idDosen));
            if (result != 0) {
              message = 'Berhasil ubah dosen';
              toastType = ToastType.Success;
            } else {
              message = 'Gagal ubah dosen';
              toastType = ToastType.Error;
            }
          } else {
            print('masuk insert');
            result = await context
                .read(dosenProvider)
                .insertDosen(model)
                .whenComplete(() async => await context.refresh(totalAllDosen));

            if (result != 0) {
              message = 'Berhasil tambah dosen';
              toastType = ToastType.Success;
            } else {
              message = 'Gagal tambah dosen';
              toastType = ToastType.Error;
            }
          }
        } else {
          message = 'Masukkan gambar dosen';
          toastType = ToastType.Error;
        }

        if (modelEdit.idDosen == null) {
          nameDosen.clear();
          emailDosen.clear();
          telpDosen.clear();
        }
      } catch (e) {
        message = e.toString();
        toastType = ToastType.Error;
      }
      await GlobalFunction.showToast(message: message, toastType: toastType);
    } else {
      return;
    }
  }

  static Future<void> addAndUpdatePelajaran(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    @required TextEditingController namePelajaran,
  }) async {
    var result = 0;
    var message = '';
    ToastType toastType;
    final form = formKey.currentState;
    final modelEdit = context.read(PelajaranModelEdit).state;
    if (form.validate()) {
      try {
        final dosen = context.read(PelajaranDropdownDosen).state;
        final semester = context.read(PelajaranDropdownSemester).state;
        final listDay = context.read(PelajaranSelectedDay).state;
        final selectedTimeOfDay = context.read(PelajaranSelectedTime).state;
        final reminderValue = context.read(PelajaranReminderValue).state;
        final reminderType = context.read(PelajaranReminderType).state;

        final now = DateTime.now();
        final combineDateTime = DateTime(
          now.year,
          now.month,
          now.day,
          selectedTimeOfDay.hour,
          selectedTimeOfDay.minute,
        );

        if (listDay.isNotEmpty) {
          var tempModel = PelajaranModel(
            namePelajaran: namePelajaran.text,
            dosen: dosen,
            hari: listDay,
            semester: semester,
            waktuPelajaran: combineDateTime,
            durationReminder: reminderValue,
            reminderModel: reminderType,
          );

          if (modelEdit.idPelajaran != null) {
            print('masuk edit');
            // print(tempModel);
            result = await context.read(pelajaranProvider).updatePelajaran(
              tempModel.copyWith(idPelajaran: modelEdit.idPelajaran),
              onSuccessUpdate: (uniqueIDNotification) async {
                await notificationPlugin.cancelNotification(uniqueIDNotification);
                final whenReminderShow = CommonFunction.chooseReminderType(
                  tempModel.reminderModel,
                  tempModel.durationReminder,
                );

                if (whenReminderShow != null) {
                  final pelajaran = context.read(showPelajaranById(modelEdit.idPelajaran));
                  for (var i = 0; i < pelajaran.hari.length; i++) {
                    final newCombineDate = combineDateTime.subtract(whenReminderShow);
                    await notificationPlugin.showWeeklyAtDayTime(
                      dayValue: pelajaran.hari[i].idDay,
                      time: Time(newCombineDate.hour, newCombineDate.minute, 0),
                      id: uniqueIDNotification + i,
                      titleNotification: 'Bersiap untuk pelajaran ${pelajaran.namePelajaran}',
                      bodyNotification:
                          'Pelajaran akan dimulai pada jam ${GlobalFunction.formatHoursMinutes(combineDateTime)}',
                      payloadNotification: tempModel.idPelajaran.toString(),
                    );
                  }
                }
              },
            );
            if (result != 0) {
              message = 'Berhasil mengubah pelajaran';
              toastType = ToastType.Success;
            } else {
              message = 'Gagal mengubah pelajaran';
              toastType = ToastType.Error;
            }
          } else {
            print('masuk insert ');
            result = await context.read(pelajaranProvider).insertPelajaran(
              tempModel,
              onSuccessInsert: (uniqueIDNotification, lastID) async {
                final whenReminderShow = CommonFunction.chooseReminderType(
                  reminderType,
                  reminderValue,
                );
                if (whenReminderShow != null) {
                  final pelajaran = context.read(showPelajaranById(lastID));
                  for (var i = 0; i < pelajaran.hari.length; i++) {
                    final newCombineDate = combineDateTime.subtract(whenReminderShow);
                    await notificationPlugin.showWeeklyAtDayTime(
                      dayValue: pelajaran.hari[i].idDay,
                      time: Time(newCombineDate.hour, newCombineDate.minute, 0),
                      id: uniqueIDNotification + i,
                      titleNotification: 'Bersiap untuk pelajaran ${pelajaran.namePelajaran}',
                      bodyNotification:
                          'Pelajaran akan dimulai pada jam ${GlobalFunction.formatHoursMinutes(combineDateTime)}',
                      payloadNotification: lastID.toString(),
                    );
                  }
                }
              },
            ).whenComplete(() async => await context.refresh(totalAllPelajaran));
            if (result != 0) {
              message = 'Berhasil Menambah Pelajaran';
              toastType = ToastType.Success;
            } else {
              message = 'Gagal menambah pelajaran';
              toastType = ToastType.Error;
            }
          }
        } else {
          message = 'Pilih Minimal 1 hari';
          toastType = ToastType.Error;
        }
        if (modelEdit.idPelajaran == null) {
          namePelajaran.clear();
          context.read(PelajaranSelectedDay).state = [];
          context.read(PelajaranDropdownSemester).state = null;
          context.read(PelajaranDropdownDosen).state = null;
        }
      } catch (e) {
        message = e.toString();
        toastType = ToastType.Error;
      }
      await GlobalFunction.showToast(message: message, toastType: toastType);
    } else {
      return;
    }
  }

  static Future<void> addAndUpdateTugas(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    @required TextEditingController nameTugas,
    @required TextEditingController deskripsiTugas,
  }) async {
    final form = formKey.currentState;
    final modelEdit = context.read(TugasModelEdit).state;
    int result;
    var message;
    ToastType toastType;
    if (form.validate()) {
      try {
        context.read(GlobalLoadingBuilder).state = true;
        final selectedDateTime = context.read(TugasSelectedDate).state;
        final selectedTimeOfDay = context.read(TugasSelectedTime).state;
        final pelajaran = context.read(TugasDropdownPelajaran).state;
        final reminderValue = context.read(TugasReminderValue).state;
        final reminderType = context.read(TugasReminderType).state;

        final combineDateTime = DateTime(
          selectedDateTime.year,
          selectedDateTime.month,
          selectedDateTime.day,
          selectedTimeOfDay.hour,
          selectedTimeOfDay.minute,
        );
        var tempModel = TugasModel(
          nameTugas: nameTugas.text,
          deskripsiTugas: deskripsiTugas.text,
          deadlineTugas: combineDateTime,
          pelajaran: pelajaran,
          statusTugas: false,
          durationReminder: reminderValue,
          reminderModel: reminderType,
        );
        if (modelEdit.idTugas != null) {
          // print(modelEdit);
          result = await context.read(tugasProvider).updateTugas(
            tempModel.copyWith(
              idTugas: modelEdit.idTugas,
              statusTugas: modelEdit.statusTugas,
            ),
            onSuccessUpdate: (uniqueIDNotification) async {
              await notificationPlugin.cancelNotification(uniqueIDNotification);
              final whenReminderShow = CommonFunction.chooseReminderType(
                tempModel.reminderModel,
                tempModel.durationReminder,
              );
              if (whenReminderShow != null) {
                await CRUDFunction._scheduleTugasNotification(
                  tempModel,
                  uniqueIDNotification,
                  whenReminderShow,
                );
              }
            },
          );

          if (result != 0) {
            message = 'Berhasil mengubah tugas';
            toastType = ToastType.Success;
          } else {
            message = 'Gagal mengubah tugas';
            toastType = ToastType.Error;
          }
        } else {
          // print(tempModel);
          result = await context
              .read(tugasProvider)
              .insertTugas(
                  model: tempModel,
                  onSuccessInsert: (uniqueIDNotification, lastID) async {
                    final whenReminderShow = CommonFunction.chooseReminderType(
                      reminderType,
                      reminderValue,
                    );
                    if (whenReminderShow != null) {
                      await CRUDFunction._scheduleTugasNotification(
                        tempModel,
                        uniqueIDNotification,
                        whenReminderShow,
                        lastID: lastID,
                      );
                    }
                  })
              .whenComplete(() async => await context.refresh(totalAllTugas));
          if (result != 0) {
            message = 'Berhasil menambahkan tugas';
            toastType = ToastType.Success;
          } else {
            message = 'Gagal menambahkan tugas';
            toastType = ToastType.Error;
          }
        }

        ///* Check apakah dalam mode edit / tambah
        ///* Jika dalam mode tambah , reset form
        if (modelEdit.idTugas == null) {
          nameTugas.clear();
          deskripsiTugas.clear();
        }
      } catch (e) {
        message = e.toString();
        toastType = ToastType.Error;
      }
      context.read(GlobalLoadingBuilder).state = false;
      await GlobalFunction.showToast(message: message, toastType: toastType);
    } else {
      return;
    }
  }

  static Future<void> CRUDdeleteDosen(BuildContext context, {@required int idDosen}) async {
    var message;
    ToastType toastType;
    try {
      print('jalanakan delete dosen');
      await context.read(dosenProvider).deleteDosen(idDosen).whenComplete(() {
        final pelajaranByDosen = context.read(showPelajaranByDosen(idDosen));
        context.read(pelajaranProvider).deletePelajaranByDosen(idDosen);
        for (var plj in pelajaranByDosen) {
          context.read(tugasProvider).deleteTugasByPelajaran(plj.idPelajaran);
        }
      });
      print('jalanakan refresh totaldosen');
      await context.refresh(totalAllDosen);
      print('jalanakan refresh totalPelajaran');
      await context.refresh(totalAllPelajaran);
      print('jalanakan refresh totalTugas');
      await context.refresh(totalAllTugas);
      message = 'Berhasil menghapus dosen';
      toastType = ToastType.Success;
    } catch (e) {
      message = e.toString();
      toastType = ToastType.Error;
    }
    await GlobalFunction.showToast(message: message, toastType: toastType);
  }

  static Future<void> CRUDDeletePelajaran(BuildContext context, {@required int idPelajaran}) async {
    var message;
    ToastType toastType;
    try {
      await context.read(pelajaranProvider).deletePelajaran(idPelajaran).whenComplete(() {
        context.read(tugasProvider).deleteTugasByPelajaran(idPelajaran);
      });
      await context.refresh(totalAllPelajaran);
      await context.refresh(totalAllTugas);
      message = 'Berhasil menghapus pelajaran';
      toastType = ToastType.Success;
    } catch (e) {
      message = e.toString();
      toastType = ToastType.Error;
    }
    await GlobalFunction.showToast(message: message, toastType: toastType);
  }

  static Future<void> CRUDupdateStatusTugas(BuildContext context, {@required int idTugas}) async {
    var message;
    ToastType toastType;
    try {
      await context.read(tugasProvider).updateStatusTugas(true, idTugas);
      message = 'Berhasil Update Status Tugas';
      toastType = ToastType.Success;
    } catch (e) {
      message = e.toString();
      toastType = ToastType.Error;
    }
    await GlobalFunction.showToast(message: message, toastType: toastType);
  }

  static Future<void> CRUDdeleteTugas(BuildContext context) async {
    var message;
    ToastType toastType;
    try {
      final id = context.read(IDTugas).state;
      print('CRUDDeleteTugas $id');
      await context
          .read(tugasProvider)
          .deleteTugas(id)
          .whenComplete(() => context.refresh(totalAllTugas));
      message = 'Berhasil menghapus tugas';
      toastType = ToastType.Success;
    } catch (e) {
      message = e.toString();
      toastType = ToastType.Error;
    }
    if (toastType == ToastType.Success) {
      await GlobalFunction.showToast(message: message, toastType: toastType);
      Navigator.of(context).pop();
    }
  }

  ///* Write List Dosen, Pelajaran & Tugas into .txt
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // print('LocationBackup ${directory.path}');

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileNameBackup');
  }

  Future<File> _writeBackup(Map<String, List> data) async {
    final file = await CRUDFunction()._localFile;
    final encodedData = json.encode(data);
    // print('result writeBackup ${encodedData}');
    return file.writeAsString(encodedData);
  }

  static Future<Map<String, dynamic>> readBackup(File file) async {
    try {
      if (file == null) {
        return null;
      }
      var data = await file.readAsString();
      final Map<String, dynamic> decodedData = json.decode(data);
      return decodedData;
    } catch (e) {
      rethrow;
    }
  }

  ///* End Write File

  ///* Share Backup File
  static Future<void> exportData(
    BuildContext context, {
    Function(int totalDataExport) onExportProgress,
  }) async {
    var message;
    var toastType;
    try {
      context.read(GlobalProgressExport).state = 0;
      var tempMap = <String, List>{};
      final dosen = context.read(dosenProvider.state);
      final pelajaran = context.read(pelajaranProvider.state);
      final tugas = context.read(tugasProvider.state);

      if (dosen == null || dosen.isEmpty) {
        tempMap['dosen'] = [];
      } else {
        tempMap['dosen'] = [...dosen];
      }
      context.read(GlobalProgressExport).state += tempMap['dosen'].length;

      if (pelajaran == null || pelajaran.isEmpty) {
        tempMap['pelajaran'] = [];
      } else {
        tempMap['pelajaran'] = [...pelajaran];
      }
      context.read(GlobalProgressExport).state += tempMap['pelajaran'].length;

      if (tugas == null || tugas.isEmpty) {
        tempMap['tugas'] = [];
      } else {
        tempMap['tugas'] = [...tugas];
      }
      context.read(GlobalProgressExport).state += tempMap['tugas'].length;

      onExportProgress(dosen.length + pelajaran.length + tugas.length);

      var file = await CRUDFunction()._writeBackup(tempMap);
      // print(file);
      if (file == null) {
        message = 'Terjadi masalah saat mem-backup data';
        throw message;
      }

      final path = await CRUDFunction()._localPath;

      await Share.shareFiles(
        ['$path/$_fileNameBackup'],
        text: 'Data Dosen , Pelajaran dan Tugas Aplikasi Peduli Tugas ',
      );
    } catch (e) {
      message = e.toString();
      toastType = ToastType.Error;
    }
    await GlobalFunction.showToast(message: message, toastType: toastType);
  }

  static Future<void> importData(
    BuildContext context, {
    Function(int totalDataImport) onProgressImport,
  }) async {
    var message;
    var toastType;
    try {
      ///* Fungsi untuk memilih file dari file explorer
      var filePicker =
          await FilePicker.platform.pickFiles(allowedExtensions: ['txt'], type: FileType.custom);

      ///* Handle jika user tidak jadi pilih file
      if (filePicker == null) {
        message = 'Terjadi masalah saat memilih file';
        throw message;
      }

      final file = File(filePicker.files.single.path);

      ///* Handle jika nama file tidak sesuai dengan [fileNameBackup = peduli_tugas_export.txt]
      var fileName = file.path.split('/').last;
      if (!fileName.contains(_filterFileNameBackup)) {
        message = 'File tidak sesuai , pastikan file yang dipilih sudah benar';
        throw message;
      }

      ///* Handle jika isi file kosong
      final readFile = await CRUDFunction.readBackup(file);
      if (readFile == null) {
        message = 'Isi file kosong';
        throw message;
      }

      final List decodedDosen = readFile['dosen'];
      final List decodedPelajaran = readFile['pelajaran'];
      final List decodedTugas = readFile['tugas'];

      ///* Proses mapping sesuai dengan modelnya
      final resultDosen = decodedDosen.map((e) => DosenModel.fromJson(e)).toList();
      final resultPelajaran = decodedPelajaran.map((e) => PelajaranModel.fromJson(e)).toList();
      final resultTugas = decodedTugas.map((e) => TugasModel.fromJson(e)).toList();
      onProgressImport(resultDosen.length + resultPelajaran.length + resultTugas.length);

      ///* Initialize value for looping import
      var count = 1;

      ///* Mulai melakukan import
      for (var dsn in resultDosen) {
        await context.read(dosenProvider).importDosen(dsn);
        context.read(GlobalProgressImport).state = count++;
      }
      for (var plj in resultPelajaran) {
        final whenReminderShow =
            CommonFunction.chooseReminderType(plj.reminderModel, plj.durationReminder);
        await context.read(pelajaranProvider).importPelajaran(plj);
        context.read(GlobalProgressImport).state = count++;
        if (whenReminderShow != null) {
          final combineDateTime = DateTime(
            plj.waktuPelajaran.year,
            plj.waktuPelajaran.month,
            plj.waktuPelajaran.day,
            plj.waktuPelajaran.hour,
            plj.waktuPelajaran.minute,
          );
          final pelajaran = context.read(showPelajaranById(plj.idPelajaran));
          for (var i = 0; i < pelajaran.hari.length; i++) {
            final newCombineDate = combineDateTime.subtract(whenReminderShow);
            await notificationPlugin.showWeeklyAtDayTime(
              dayValue: pelajaran.hari[i].idDay,
              time: Time(newCombineDate.hour, newCombineDate.minute, 0),
              id: plj.waktuPelajaran.millisecondsSinceEpoch ~/ 1000 + i,
              titleNotification: 'Bersiap untuk pelajaran ${pelajaran.namePelajaran}',
              bodyNotification:
                  'Pelajaran akan dimulai pada jam ${GlobalFunction.formatHoursMinutes(combineDateTime)}',
              payloadNotification: plj.idPelajaran.toString(),
            );
          }
        }
      }
      for (var tgs in resultTugas) {
        final whenReminderShow =
            CommonFunction.chooseReminderType(tgs.reminderModel, tgs.durationReminder);
        await context.read(tugasProvider).importTugas(tgs);
        context.read(GlobalProgressImport).state = count++;
        if (whenReminderShow != null) {
          await CRUDFunction._scheduleTugasNotification(
            tgs,
            tgs.deadlineTugas.millisecondsSinceEpoch,
            whenReminderShow,
            lastID: tgs.idTugas,
          );
        }
      }

      ///* For refreshing total Dosen,Pelajaran and Tugas
      await context.refresh(totalAllDosen);
      await context.refresh(totalAllPelajaran);
      await context.refresh(totalAllTugas);

      message = 'Proses import berhasil';
      toastType = ToastType.Success;

      ///* Selesai import
    } catch (e) {
      message = e.toString();
      toastType = ToastType.Error;
    }
    await GlobalFunction.showToast(message: message, toastType: toastType);
  }

  ///* End Shared Backup FILE

  ///* Schedule Tugas Notification
  static Future<void> _scheduleTugasNotification(
    TugasModel model,
    int uniqueIDNotification,
    Duration duration, {
    int lastID,
  }) async {
    await notificationPlugin.scheduleNotification(
      dateTimeShowNotification: model.deadlineTugas.subtract(duration),
      idNotification: uniqueIDNotification,
      titleNotification: 'Pelajaran : ' + model.pelajaran.namePelajaran,
      bodyNotification: model.nameTugas +
          '.Deadline : ' +
          GlobalFunction.formatYearMonthDaySpecific(model.deadlineTugas) +
          ' ' +
          GlobalFunction.formatHoursMinutes(model.deadlineTugas),
      payloadNotification: lastID == null ? 'payload null' : lastID.toString(),
    );
  }

  ///* End Schedule Notification
}
