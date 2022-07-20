import "package:flutter/material.dart";
import 'package:interns_nurse_application/model/nurse_task_model.dart';
import 'package:interns_nurse_application/view/task/task_icon.dart';
import 'package:interns_nurse_application/view/util/generic_text.dart';

// to make the standar bottom navigation
class NurseTaskView extends StatelessWidget {
  final NurseTaskModel nurseTask;

  const NurseTaskView({required this.nurseTask, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenericText(text: nurseTask.orderId),
              GenericText(text: nurseTask.orderDate + " " + nurseTask.orderTime),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenericText(text: nurseTask.patientId),
              GenericText(text: nurseTask.roomId + " " + nurseTask.bedId),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenericText(text: nurseTask.orderTypeId + ": " + nurseTask.orderName),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GenericText(text: nurseTask.nurseId),
                ],
              ),
              Row(
                children: [
                  NurseTaskIcon(
                      nurseTask: nurseTask,
                      icon: Icons.thumb_up,
                      active: nurseTask.status == "OK"),
                  NurseTaskIcon(
                      nurseTask: nurseTask,
                      icon: Icons.loop,
                      active: nurseTask.status == "IN_PROGRESS"),
                  NurseTaskIcon(
                      nurseTask: nurseTask,
                      icon: Icons.done,
                      active: nurseTask.status == "DONE"),
                  NurseTaskIcon(
                      nurseTask: nurseTask,
                      icon: Icons.assignment_turned_in,
                      active: nurseTask.status == "CLOSE"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
