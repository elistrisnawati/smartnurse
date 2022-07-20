import "package:flutter/material.dart";
import 'package:intern_nurse_application_v3/data/constant_data.dart';

// to make the standar bottom navigation
class IconLogout extends StatelessWidget {
  final Function() functionExit;

  const IconLogout({
    required this.functionExit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        functionExit();
      },
      icon: const Icon(
        Icons.logout,
        color: Colors.blue,
        size: ConstantData.iconSizeLarge,
      ),
    );
  }
}
