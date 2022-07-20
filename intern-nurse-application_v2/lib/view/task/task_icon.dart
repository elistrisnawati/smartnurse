import "package:flutter/material.dart";
import 'package:intern_nurse_application_v2/data/constant_data.dart';
import 'package:intern_nurse_application_v2/model/nurse_task_model.dart';

// to make the standar bottom navigation
class NurseTaskIcon extends StatelessWidget {
  final IconData icon;
  final bool active;

  final NurseTaskModel nurseTask;

  const NurseTaskIcon(
      {required this.nurseTask,
      required this.icon,
      required this.active,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print("TAPPED");
      },
      tooltip: 'Action Tool Tip',
      icon: Icon(
        icon,
        color: active ? Colors.green : Colors.grey,
        size: ConstantData.iconSize,
      ),
    );
  }
}
