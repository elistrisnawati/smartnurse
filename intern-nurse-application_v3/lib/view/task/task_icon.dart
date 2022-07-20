import "package:flutter/material.dart";
import 'package:intern_nurse_application_v3/data/activity_helper.dart';
import 'package:intern_nurse_application_v3/data/api_constant.dart';
import 'package:intern_nurse_application_v3/data/constant_data.dart';
import 'package:intern_nurse_application_v3/main.dart';
import 'package:intern_nurse_application_v3/model/nurse_task_model.dart';
import 'package:intern_nurse_application_v3/util/api_service.dart';
import 'package:intern_nurse_application_v3/util/notification_helper.dart';
import 'package:intern_nurse_application_v3/util/provider/nurse_task_provider.dart';
import 'package:intern_nurse_application_v3/util/shared_helper.dart';

// to make the standar bottom navigation
class NurseTaskIcon extends StatelessWidget {
  final NurseTaskProvider provider;

  final IconData icon;
  final bool active;

  final String status;

  final NurseTaskModel nurseTask;

  const NurseTaskIcon({
    required this.provider,
    required this.nurseTask,
    required this.icon,
    required this.status,
    required this.active,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        String user = await SharedPreferencesHelper.getUser();

        await ApiService().update(
            secretKey: ApiConstant.secretKeyNurseTask,
            uniqueId: nurseTask.orderId,
            updatedData: {
              "nurseId": user,
              "status": status,
              "ACTIVE": status != "CLOSE",
            });

        await ActivityHelper.createActivity(
            nurseTask.patientId,
            "[${nurseTask.orderTypeId}] ${nurseTask.patientId}",
            "R: ${nurseTask.orderName} is $status");

        await ActivityHelper.createActivity(
            user,
            "[${nurseTask.orderTypeId}] ${nurseTask.patientId}",
            "R: ${nurseTask.orderName} is $status");

        await NotificationHelper().showNotification(
            flutterLocalNotificationsPlugin,
            "[${nurseTask.orderTypeId}] ${nurseTask.patientId}",
            "The request for ${nurseTask.orderName} is $status");

        await provider.reload();
      },
      icon: Icon(
        icon,
        color: active ? Colors.green : Colors.grey,
        size: ConstantData.iconSize,
      ),
    );
  }
}
