import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

enum TimeFormat { Jam, JamMenit, JamMenitDetik, Menit, MenitDetik, Detik }
enum ToastPositioned { Bottom, Center, Top }
enum ToastType { Success, Error, Normal }

class GlobalFunction {
  static final DefaultCacheManager _cacheManager = DefaultCacheManager();

  /// Fungsi untuk Meng-compare 2 versi dari server dan aplikasi , jika cocok tampilkan halaman Splash || Halaman Update
  Widget compareVersion({
    /// Versi Aplikasi di Mobile
    @required String currentVersion,

    /// Versi Aplikasi Dari Server
    @required String newestVersion,

    /// Menampilkan Halaman UpdateScreen
    @required Widget updateScreen,

    /// Menampilkan Halaman SplashScreen
    @required Widget splashScreen,
  }) {
    final splitNVersion = newestVersion.toLowerCase().trim().split('-');
    final splitCVersion = currentVersion.toLowerCase().trim().split('-');
    final nVersion = splitNVersion[1];
    final cVersion = splitCVersion[1];
    // print('$newestVersion ||| $currentVersion');
    // print('$nVersion ||| $cVersion');
    if (nVersion != cVersion) {
      return updateScreen;
    } else {
      return splashScreen;
    }
  }

  static void clearCacheApp() {
    GlobalFunction._cacheManager.emptyCache();
  }

  //!------------------------------------------------------------------------------------------------------------
  /// Fungsi Untuk Mem-format Angka . Dari 200000 => 200,000
  static String formatNumber(int value, [String string = '']) {
    final formatter = NumberFormat('#,###');
    final result = formatter.format(value);
    return '$result $string';
  }

  /// Fungsi Untuk meng-unformat angka . Dari 200,000 => 200000
  static String unFormatNumber(String number) {
    // print('Sebelum di Format $number');
    final result = number.replaceAll(',', '').trim();
    return result;
  }

  /// Format : Jam
  static String formatHours(DateTime date) {
    return DateFormat.H(appConfig.indonesiaLocale).format(date);
  }

  /// Format : Jam:Menit
  static String formatHoursMinutes(DateTime date) {
    return DateFormat.Hm(appConfig.indonesiaLocale).format(date);
  }

  /// Format : Jam:Menit:Detik
  static String formatHoursMinutesSeconds(DateTime date) {
    final result = DateFormat.Hms(appConfig.indonesiaLocale).format(date);
    return result.replaceAll('.', ':');
  }

  /// Format Hari
  static String formatDay(DateTime date, {int type = 2}) {
    if (type == 1) {
      return DateFormat.E(appConfig.indonesiaLocale).format(date);
    } else {
      return DateFormat.EEEE(appConfig.indonesiaLocale).format(date);
    }
  }

  /// Format Bulan
  static String formatMonth(DateTime date, {int type = 1}) {
    switch (type) {
      case 1:
        return DateFormat.M(appConfig.indonesiaLocale).format(date);
        break;
      case 2:
        return DateFormat.MMM(appConfig.indonesiaLocale).format(date);
        break;
      case 3:
        return DateFormat.MMMM(appConfig.indonesiaLocale).format(date);
        break;
      default:
        return DateFormat.MMMM(appConfig.indonesiaLocale).format(date);
        break;
    }
  }

  /// Format Bulan Hari
  static String formatMonthDay(DateTime date, {int type = 1}) {
    switch (type) {
      case 1:
        return DateFormat.MMMd(appConfig.indonesiaLocale).format(date);
        break;
      case 2:
        return DateFormat.MMMEd(appConfig.indonesiaLocale).format(date);
        break;
      case 3:
        return DateFormat.MMMMd(appConfig.indonesiaLocale).format(date);
        break;
      case 4:
        return DateFormat.MMMMEEEEd(appConfig.indonesiaLocale).format(date);
        break;
      default:
        return DateFormat.MMMMEEEEd(appConfig.indonesiaLocale).format(date);
        break;
    }
  }

  /// Format : Tahun
  static String formatYear(DateTime date) {
    return DateFormat.y(appConfig.indonesiaLocale).format(date);
  }

  /// Format : Tahun:Bulan[type=?]
  static String formatYearMonth(DateTime date, {int type = 3}) {
    if (type == 1) {
      return DateFormat.yM(appConfig.indonesiaLocale).format(date);
    } else if (type == 2) {
      return DateFormat.yMMM(appConfig.indonesiaLocale).format(date);
    } else if (type == 3) {
      return DateFormat.yMMMM(appConfig.indonesiaLocale).format(date);
    } else {
      return DateFormat.yMMMM(appConfig.indonesiaLocale).format(date);
    }
  }

  /// Format : Tahun:Bulan:Hari[type=1/2/3]
  static String formatYearMonthDay(DateTime date, {int type = 1}) {
    if (type == 1) {
      return DateFormat.yMd(appConfig.indonesiaLocale).format(date);
    } else if (type == 2) {
      return DateFormat.yMMMd(appConfig.indonesiaLocale).format(date);
    } else if (type == 3) {
      return DateFormat.yMMMMd(appConfig.indonesiaLocale).format(date);
    } else {
      return DateFormat.yMMMMd(appConfig.indonesiaLocale).format(date);
    }
  }

  /// Format : Tahun:Bulan:Hari[type=?] , Specific disini maksudnya Hari = Senin,Selasa,Rabu,Kamis,Jumat,Sabtu,Minggu
  static String formatYearMonthDaySpecific(DateTime date, {int type = 3}) {
    if (type == 1) {
      return DateFormat.yMEd(appConfig.indonesiaLocale).format(date);
    } else if (type == 2) {
      return DateFormat.yMMMEd(appConfig.indonesiaLocale).format(date);
    } else if (type == 3) {
      return DateFormat.yMMMMEEEEd(appConfig.indonesiaLocale).format(date);
    } else {
      return DateFormat.yMMMMEEEEd(appConfig.indonesiaLocale).format(date);
    }
  }

  /// Format : Time => Jam Menit
  static String formatTimeTo(
    String time, {
    TimeFormat timeFormat,
  }) {
    if (time == null) {
      return '-';
    } else {
      final hour = time.replaceAll(':', '').substring(0, 2);
      final minute = time.replaceAll(':', '').substring(2, 4);
      final second = time.replaceAll(':', '').substring(4, 6);
      String resultHour, resultMinute, resultSecond;
      if (hour.startsWith('0')) {
        resultHour = hour.substring(1);
      } else {
        resultHour = hour;
      }
      if (minute.startsWith('0')) {
        resultMinute = minute.substring(1);
      } else {
        resultMinute = minute;
      }
      if (second.startsWith('0')) {
        resultSecond = second.substring(1);
      } else {
        resultSecond = second;
      }

      switch (timeFormat) {
        case TimeFormat.Jam:
          return '$resultHour Jam ';
          break;
        case TimeFormat.JamMenit:
          return '$resultHour Jam $resultMinute Menit';
          break;
        case TimeFormat.JamMenitDetik:
          return '$resultHour Jam $resultMinute Menit $resultSecond Detik';
          break;
        case TimeFormat.Menit:
          return '$resultMinute Menit';
          break;
        case TimeFormat.MenitDetik:
          return '$resultMinute Menit $resultSecond Detik';
          break;
        case TimeFormat.Detik:
          return '$resultSecond Detik';
          break;
        default:
          return '$resultHour Jam $resultMinute Menit $resultSecond Detik';
      }
    }
  }

  ///! Mendapatkan Total Hari Pada bulan X
  static int totalDaysOfMonth(int year, int month) {
    final result = (month < 12) ? DateTime(year, month + 1, 0) : DateTime(year + 1, 1, 0);
    return result.day;
  }

  ///! Mendapatkan Total Jumlah Kerja yang sudah dikurangi weekend (Sabtu,Minggu).
  static int totalWeekDayOfMonth(int year, int month, {int day = 1}) {
    final totalDayOfMonth = totalDaysOfMonth(year, month);
    var result = 0;
    var tempDateTime = DateTime(year, month, day);
    for (var i = day; i <= totalDayOfMonth; i++) {
      tempDateTime = DateTime(tempDateTime.year, tempDateTime.month, i);
      if (tempDateTime.weekday == DateTime.saturday || tempDateTime.weekday == DateTime.sunday) {
        // print('is weekend');
      } else {
        result++;
      }
    }
    return result;
  }

  static Future<PackageInfo> packageInfo() async {
    final result = await PackageInfo.fromPlatform();
    return result;
  }

  ///! Memunculkan Toast

  static Future<void> showToast({
    @required String message,
    bool isLongDuration = false,
    Color backgroungColor,
    Color textColor,
    double fontSize = 16.0,
    ToastPositioned toastPositioned,
    ToastType toastType = ToastType.Normal,
  }) async {
    ToastGravity positioned;
    Color toastColor;
    Color toastTextColor;

    switch (toastPositioned) {
      case ToastPositioned.Top:
        positioned = ToastGravity.TOP;
        break;
      case ToastPositioned.Center:
        positioned = ToastGravity.CENTER;
        break;
      default:
        positioned = ToastGravity.BOTTOM;
        break;
    }
    switch (toastType) {
      case ToastType.Error:
        toastColor = Colors.red;
        toastTextColor = Colors.white;
        break;
      case ToastType.Success:
        toastColor = Colors.green;
        toastTextColor = Colors.white;
        break;
      default:
        toastColor = backgroungColor;
        toastTextColor = textColor;
        break;
    }
    await Fluttertoast.showToast(
      msg: message.toString(),
      backgroundColor: toastColor,
      textColor: toastTextColor,
      fontSize: fontSize,
      toastLength: isLongDuration ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: positioned,
    );
  }

  static Future<void> cancelToast() async {
    await Fluttertoast.cancel();
  }

  ///! Ketuk 2 Kali Untuk Keluar
  static Future<bool> doubleTapToExit({
    @required GlobalKey<ScaffoldState> scaffoldKey,
  }) async {
    DateTime _currentBackPressTime;
    final now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime) > const Duration(seconds: 2)) {
      _currentBackPressTime = now;
      await GlobalFunction.showToast(message: 'Tekan Sekali Lagi Untuk Keluar Aplikasi');
      // print('Press Again To Close Application');
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  ///! Get First Character From Every Word
  static String getFirstCharacterErveryWord({String string, int limitTo}) {
    var result;
    if (string.isNotEmpty) {
      result = string.trim().split(' ').map((e) => e[0]).take(limitTo).join();
    } else {
      result = '';
    }
    return result;
  }

  static int getTotalLenghtWord(String string, {int substract}) {
    var length = string.split(' ').length;
    int result;
    if (substract != null) {
      if (length - substract <= 0) {
        result = 1;
      } else {
        result = length - substract;
      }
    } else {
      result = length;
    }

    return result;
  }

  static Color getRandomColor() {
    final _random = Random();
    var color = colorPallete.arr_color[_random.nextInt(colorPallete.arr_color.length)];
    return color;
  }
}

class InputNumberFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      var selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;
      final f = NumberFormat('#,###');
      var num = int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(num);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}
