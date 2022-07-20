import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intern_nurse_application_v2/page/home/home_page.dart';
import 'package:intern_nurse_application_v2/util/api_service.dart';
import 'package:intern_nurse_application_v2/util/notification_helper.dart';

import 'data/constant_data.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  _notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);

  await _notificationHelper.showNotification(
      flutterLocalNotificationsPlugin,
      "TITLE",
      "HELLO WORLD");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = ConstantData.textTitle;

  @override
  Widget build(BuildContext context) {
    // print("TEST API");
    // ApiService().query();
    // ApiService().load();

    return MaterialApp(
      theme: ThemeData(
        fontFamily: ConstantData.fontFamily,
      ),
      title: _title,
      home: const HomePage(),
    );
  }
}
