import "package:flutter/material.dart";
import 'package:intern_nurse_application_v3/data/activity_helper.dart';
import 'package:intern_nurse_application_v3/data/api_constant.dart';
import 'package:intern_nurse_application_v3/main.dart';
import 'package:intern_nurse_application_v3/model/rest/document_output.dart';
import 'package:intern_nurse_application_v3/util/api_service.dart';
import 'package:intern_nurse_application_v3/util/notification_helper.dart';
import 'package:intern_nurse_application_v3/util/shared_helper.dart';
import 'package:intl/intl.dart';

// to make the standar bottom navigation
class RequestItem extends StatelessWidget {
  final String requestGroup;
  final String requestItem;

  const RequestItem({
    required this.requestGroup,
    required this.requestItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor color = Colors.grey;

    return GestureDetector(
      onTap: () async {
        String user = await SharedPreferencesHelper.getUser();

        DocumentOutput patient = await ApiService()
            .load(secretKey: ApiConstant.secretKeyPatient, uniqueId: user);

        String orderId = DateTime.now()
            .millisecondsSinceEpoch
            .toRadixString(16)
            .toUpperCase();

        await ApiService().insert(
          secretKey: ApiConstant.secretKeyNurseTask,
          uniqueId: user,
          document: {
            "ACTIVE": true,
            "NAME": user,
            "UNIQUE_ID": orderId,
            "bedId": patient.document.contentMap["bedId"],
            "nurseId": "",
            "orderDate": DateFormat('dd-MMM-yyyy').format(DateTime.now()),
            "orderTime": DateFormat('hh:mm').format(DateTime.now()),
            "orderId": orderId,
            "orderName": requestItem,
            "orderTypeId": requestGroup,
            "patientId": user,
            "roomId": patient.document.contentMap["roomId"],
            "status": "NEW",
          },
        );

        await ActivityHelper.createActivity(
            user, requestGroup, "New Request: $requestItem");

        await NotificationHelper().showNotification(
            flutterLocalNotificationsPlugin,
            requestGroup,
            "Your request $requestItem has been submitted...");
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage('assets/images/request/$requestItem.jpeg'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: color,
                offset: const Offset(1.5, 1.5),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
