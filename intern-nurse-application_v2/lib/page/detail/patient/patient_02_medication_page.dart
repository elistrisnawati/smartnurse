import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v2/data/mock_up_data.dart';
import 'package:intern_nurse_application_v2/model/view/activity_view_model.dart';
import 'package:intern_nurse_application_v2/view/activity/activity_view.dart';

class PatientMedicationPage extends StatelessWidget {
  const PatientMedicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ActivityViewModel> activityList = MockUpData.buildActivityList();

    return Scaffold(
        drawer: const Drawer(),
        body: PageView.builder(
          controller: PageController(initialPage: 0, viewportFraction: 0.95),
          itemCount: activityList.length,
          itemBuilder: (context, i) {
            return ActivityView(activity: activityList[i]);
          },
        ));
  }
}
