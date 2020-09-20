import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class NotificationPlugin {
  static const soundName = 'slow_spring_board';
  static const appIcon = 'app_icon';
  static const largeIcon = 'large_icon';

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final BehaviorSubject<ReceivedNotification> didReceivedLocalNotificationSubject =
      BehaviorSubject<ReceivedNotification>();
  var initializationSettings;

  NotificationPlugin._() {
    init();
  }

  Future<void> init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    if (Platform.isIOS) {
      _requestIOSPermission();
    }
    initializePlatformSpecifics();
  }

  void initializePlatformSpecifics() {
    var initializationSettingsAndroid = AndroidInitializationSettings(appIcon);
    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        var receivedNotification =
            ReceivedNotification(id: id, title: title, body: body, payload: payload);
        didReceivedLocalNotificationSubject.add(receivedNotification);
      },
    );

    initializationSettings =
        InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
  }

  void _requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(
          alert: false,
          badge: true,
          sound: true,
        );
  }

  void setListenerForLowerVersions(Function onNotificationInLowerVersions) {
    didReceivedLocalNotificationSubject.listen((receivedNotification) {
      onNotificationInLowerVersions(receivedNotification);
      print('listen notification ${receivedNotification.id}');
    });
  }

  void setOnNotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      onNotificationClick(payload);
    });
  }

  Future<void> showNotification(
    int idNotification,
    String titleNotification,
    String bodyNotification, {
    String payloadNotification = 'payload show notification',
  }) async {
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID',
      'CHANNEL_NAME',
      'CHANNEL_DESCRIPTION',
      importance: Importance.Max,
      priority: Priority.High,
      playSound: true,
      styleInformation: DefaultStyleInformation(true, true),
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      idNotification,
      titleNotification,
      bodyNotification, //null
      platformChannelSpecifics,
      payload: payloadNotification,
    );
  }

  Future<void> scheduleNotification({
    @required DateTime dateTimeShowNotification,
    @required int idNotification,
    String titleNotification = 'default title',
    String bodyNotification = 'default body',
    String payloadNotification = 'payload schedule notification',
  }) async {
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL_ID 2',
      'CHANNEL_NAME 2',
      'CHANNEL_DESCRIPTION 2',
      sound: RawResourceAndroidNotificationSound(soundName),
      largeIcon: DrawableResourceAndroidBitmap(largeIcon),
      enableLights: true,
      color: const Color.fromARGB(255, 255, 0, 0),
      ledColor: const Color.fromARGB(255, 255, 0, 0),
      ledOnMs: 1000,
      ledOffMs: 500,
      importance: Importance.Max,
      priority: Priority.High,
      playSound: true,
      timeoutAfter: 5000,
      autoCancel: true,
      styleInformation: BigTextStyleInformation(bodyNotification, contentTitle: titleNotification),
    );
    var iosChannelSpecifics = IOSNotificationDetails(
      sound: '$soundName.aiff',
    );
    var platformChannelSpecifics = NotificationDetails(
      androidChannelSpecifics,
      iosChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.schedule(
      idNotification,
      titleNotification,
      bodyNotification,
      dateTimeShowNotification,
      platformChannelSpecifics,
      payload: payloadNotification,
    );
  }

  Future<void> showWeeklyAtDayTime({
    /// 08:00
    @required Time time,

    /// 1.Senin 2.Selasa 3.Rabu 4.Kamis 5.Jum'at 6.Sabtu 7.Minggu
    @required int dayValue,
    @required int id,
    String titleNotification = 'default title',
    String bodyNotification = 'default body',
    String payloadNotification = 'payload schedule notification',
  }) async {
    Day day;
    switch (dayValue) {
      case 1:
        day = Day.Monday;
        break;
      case 2:
        day = Day.Tuesday;
        break;
      case 3:
        day = Day.Wednesday;
        break;
      case 4:
        day = Day.Thursday;
        break;
      case 5:
        day = Day.Friday;
        break;
      case 6:
        day = Day.Saturday;
        break;
      case 7:
        day = Day.Sunday;
        break;
      default:
        return null;
        break;
    }
    print(
        'Weekly notification shown on Day $dayValue at approximately ${_toTwoDigitString(time.hour)}:${_toTwoDigitString(time.minute)}:${_toTwoDigitString(time.second)}');
    var androidChannelSpecifics = AndroidNotificationDetails(
      'show weekly channel id',
      'show weekly channel name',
      'show weekly description',
      importance: Importance.Max,
      priority: Priority.High,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      androidChannelSpecifics,
      iosChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
      id,
      titleNotification, //null
      bodyNotification,
      day,
      time,
      platformChannelSpecifics,
      payload: payloadNotification,
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // Future<void> showDailyAtTime() async {
  //   var time = Time(21, 3, 0);
  //   var androidChannelSpecifics = AndroidNotificationDetails(
  //     'CHANNEL_ID 4',
  //     'CHANNEL_NAME 4',
//     'CHANNEL_DESCRIPTION 4',
  //     importance: Importance.Max,
  //     priority: Priority.High,
  //   );
  //   var iosChannelSpecifics = IOSNotificationDetails();
  //   var platformChannelSpecifics =
  //       NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.showDailyAtTime(
  //     0,
  //     'Test Title at ${time.hour}:${time.minute}.${time.second}',
  //     'Test Body', //null
  //     time,
  //     platformChannelSpecifics,
  //     payload: 'Test Payload',
  //   );
  // }

  // Future<void> repeatNotification() async {
  //   var androidChannelSpecifics = AndroidNotificationDetails(
  //     'CHANNEL_ID 3',
  //     'CHANNEL_NAME 3',
  //     'CHANNEL_DESCRIPTION 3',
  //     importance: Importance.Max,
  //     priority: Priority.High,
  //     styleInformation: DefaultStyleInformation(true, true),
  //   );
  //   var iosChannelSpecifics = IOSNotificationDetails();
  //   var platformChannelSpecifics =
  //       NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //     0,
  //     'Repeating Test Title',
  //     'Repeating Test Body',
  //     RepeatInterval.EveryMinute,
  //     platformChannelSpecifics,
  //     payload: 'Test Payload',
  //   );
  // }

  Future<void> showNotificationWithAttachment(
    String base64Image,
    String title,
    String body, {
    String payload = 'Defualt Payload',
  }) async {
    // var attachmentPicturePath =
    //     await _downloadAndSaveFile('https://via.placeholder.com/800x200', 'attachment_img.jpg');
    var attachmentPicturePath = await _convertAndSaveFile(base64Image);
    var iOSPlatformSpecifics = IOSNotificationDetails(
      attachments: [IOSNotificationAttachment(attachmentPicturePath)],
    );
    final bigPictureStyleInformation =
        await _notificationStyleWithFile(attachmentPicturePath, title, body);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'CHANNEL ID 2',
      'CHANNEL NAME 2',
      'CHANNEL DESCRIPTION 2',
      importance: Importance.High,
      priority: Priority.High,
      styleInformation: bigPictureStyleInformation,
    );
    var notificationDetails = NotificationDetails(androidChannelSpecifics, iOSPlatformSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      '$title',
      '$body',
      notificationDetails,
      payload: payload,
    );
  }

  Future<BigPictureStyleInformation> _notificationStyleWithFile(
    String attachmentPicturePath,
    String title,
    String body,
  ) async {
    var bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(attachmentPicturePath),
      contentTitle: '<b>$title</b>',
      htmlFormatContentTitle: true,
      summaryText: '$body',
      htmlFormatSummaryText: true,
    );
    return bigPictureStyleInformation;
  }

  Future<String> _convertAndSaveFile(String base64ImageEncode) async {
    final encodeImage = base64ImageEncode;
    final bytes = base64.decode(encodeImage);
    final directory = (await getApplicationDocumentsDirectory()).path;
    final file = File('$directory/' + DateTime.now().millisecondsSinceEpoch.toString() + '.png');
    await file.writeAsBytes(bytes);
    return file.path;
    // var directory = await getApplicationDocumentsDirectory();
    // var filePath = '${directory.path}/$fileName';
    // var response = await http.get(url);
    // var file = File(filePath);
    // await file.writeAsBytes(response.bodyBytes);
    // return filePath;
  }

  // Future<int> getPendingNotificationCount() async {
  //   var p = await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  //   return p.length;
  // }
  String _toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');
  }
}

NotificationPlugin notificationPlugin = NotificationPlugin._();

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}
