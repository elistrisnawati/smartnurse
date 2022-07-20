import 'package:flutter/material.dart';

/// This class is to put all generic config for UI.
class ConstantData {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  const ConstantData._();

  static const double iconSize = 30.0;
  static const double iconSizeLarge = 60.0;

  static const String fontFamily = "TitilliumWeb";

  static const Radius edge = Radius.circular(10.0);

  static const double chatDateFontSize = 16.0;
  static const double chatFontSize = 20.0;

  static const TextStyle styleActivity = TextStyle(color: Colors.white);

  static const Color colorActivityBullet = Colors.green;

  static const String textNew = "NEW";

  static const String textTitle = "SMART NURSE";

  static const String textChatTitle = "NURSE TEAM";

  static const String headerUserViewNurse = "NURSE - ACCOUNT";

  static const String headerUserViewPatient = "PATIENT - ACCOUNT";
}
