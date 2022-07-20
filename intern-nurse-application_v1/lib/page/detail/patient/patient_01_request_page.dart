import 'package:flutter/material.dart';
import 'package:interns_nurse_application/view/request/request_group.dart';

class PatientRequestPage extends StatelessWidget {
  const PatientRequestPage({Key? key}) : super(key: key);

  final String title = "TIMELINE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            RequestGroup(
              requestId: "SMART BUTTON", //
              requestContentList: [
                "INFUSION",
                "SYRINGE",
                "URINALPOT",
                "CATHETER",
              ],
            ),
            RequestGroup(
              requestId: "EMERGENCY BUTTON", //
              requestContentList: [
                "BLOOD",
                "VOMIT",
                "HOT",
                "COLD",
              ],
            ),
            RequestGroup(
              requestId: "GENERAL REQUEST BUTTON",
              requestContentList: [
                "BED",
                "WHEELCHAIR",
              ],
            ),
          ],
        ),
      ),
    );
  }
}
