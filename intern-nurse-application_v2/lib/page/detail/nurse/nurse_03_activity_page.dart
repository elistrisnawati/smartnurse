import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v2/model/view/activity_view_model.dart';
import 'package:intern_nurse_application_v2/view/activity/activity_view.dart';

class NurseActivityPage extends StatelessWidget {
  final List<ActivityViewModel> activityList;

  const NurseActivityPage({required this.activityList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
