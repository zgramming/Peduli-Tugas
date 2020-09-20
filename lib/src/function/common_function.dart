import 'dart:convert';
import 'dart:io';

import 'package:global_template/global_template.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

import 'package:my_network/my_network.dart';

enum ReturnFile { BASE64, FILE }

class CommonFunction {
  static const _keyDarkMode = 'keyDarkMode';
  static Duration chooseReminderType(ReminderModel reminderModel, int valueDuration) {
    if (reminderModel == null) {
      return null;
    }
    switch (reminderModel.reminderType) {
      case ReminderType.Menit:
        return Duration(minutes: valueDuration);
        break;
      case ReminderType.Jam:
        return Duration(hours: valueDuration);
        break;
      case ReminderType.Hari:
        return Duration(days: valueDuration);
        break;
      default:
        return null;
        break;
    }
  }

  static Future pickImage({
    bool isCamera = true,
    ReturnFile returnFile = ReturnFile.FILE,
    double maxHeight = 600,
    double maxWidth = 480,
    int quality = 100,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: quality,
        preferredCameraDevice: preferredCameraDevice,
      );
      if (pickedFile == null) {
        print('user cancel camera');
        return;
      }
      if (returnFile == ReturnFile.BASE64) {
        var imageBytes = await pickedFile.readAsBytes();
        var base64Image = base64Encode(imageBytes);
        print('base64 image size ${await File(pickedFile.path).length()}');
        return base64Image;
      } else {
        print('File image size ${await File(pickedFile.path).length()}');
        return File(pickedFile.path);
      }
    } on IOException catch (err) {
      await GlobalFunction.showToast(message: err.toString(), toastType: ToastType.Error);
    } catch (e) {
      await GlobalFunction.showToast(message: e.toString(), toastType: ToastType.Error);
    }
  }

  static Future<bool> callPhone(String phoneNumber) async {
    try {
      final result = await launch('tel:${phoneNumber}');
      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> sendEmail(String email) async {
    try {
      final result = await launch('mailto:$email');
      return result;
    } catch (e) {
      rethrow;
    }
  }

  ///* Save session Darkmode
  static Future<void> setDarkMode(bool value) async {
    final sp = await SharedPreferences.getInstance();
    final result = await sp.setBool(_keyDarkMode, value);
    print('darkmode result $result');
  }

  ///* Read session Darkmode
  static Future<bool> readDarkModek() async {
    final sp = await SharedPreferences.getInstance();
    final result = await sp.getBool(_keyDarkMode) ?? false;
    return result;
  }
}
