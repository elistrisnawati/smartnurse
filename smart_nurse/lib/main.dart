import 'package:flutter/material.dart';
import 'package:smart_nurse/history.dart';
import 'package:smart_nurse/login.dart';
import 'package:smart_nurse/notification.dart';
import 'package:smart_nurse/registrasi.dart';
import 'package:smart_nurse/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}