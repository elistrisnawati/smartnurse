import "package:flutter/material.dart";
import 'package:intern_nurse_application_v2/data/constant_data.dart';
import 'package:intern_nurse_application_v2/model/nurse_task_model.dart';

// to make the standar bottom navigation
class GenericText extends StatelessWidget {
  final String text;

  const GenericText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
