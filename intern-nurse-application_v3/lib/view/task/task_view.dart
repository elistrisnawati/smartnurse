import "package:flutter/material.dart";
import 'package:intern_nurse_application_v3/model/nurse_task_model.dart';
import 'package:intern_nurse_application_v3/util/provider/nurse_task_provider.dart';
import 'package:intern_nurse_application_v3/view/task/task_icon.dart';
import 'package:intern_nurse_application_v3/view/util/generic_text.dart';

// to make the standar bottom navigation
class NurseTaskView extends StatelessWidget {
  final NurseTaskModel nurseTask;
  final NurseTaskProvider provider;

  const NurseTaskView({
    required this.provider,
    required this.nurseTask,
    Key? key,
  }) : super(key: key);

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
              GenericText(
                  text: "${nurseTask.orderDate} ${nurseTask.orderTime}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenericText(text: nurseTask.patientId),
              GenericText(text: "${nurseTask.roomId} ${nurseTask.bedId}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenericText(
                  text: "${nurseTask.orderTypeId}: ${nurseTask.orderName}"),
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
                      provider: provider,
                      nurseTask: nurseTask,
                      icon: Icons.thumb_up,
                      status: "OK",
                      active: nurseTask.status == "OK"),
                  NurseTaskIcon(
                      provider: provider,
                      nurseTask: nurseTask,
                      icon: Icons.loop,
                      status: "IN_PROGRESS",
                      active: nurseTask.status == "IN_PROGRESS"),
                  NurseTaskIcon(
                      provider: provider,
                      nurseTask: nurseTask,
                      icon: Icons.done,
                      status: "DONE",
                      active: nurseTask.status == "DONE"),
                  NurseTaskIcon(
                      provider: provider,
                      nurseTask: nurseTask,
                      icon: Icons.assignment_turned_in,
                      status: "CLOSE",
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
