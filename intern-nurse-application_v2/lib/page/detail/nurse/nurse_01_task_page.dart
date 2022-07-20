import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v2/data/mock_up_data.dart';
import 'package:intern_nurse_application_v2/model/nurse_task_model.dart';
import 'package:intern_nurse_application_v2/view/task/task_view.dart';

class NurseTaskPage extends StatelessWidget {
  const NurseTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NurseTaskModel> nurseTaskList = [
      MockUpData.nurseTask,
      MockUpData.nurseTask,
      MockUpData.nurseTask,
      MockUpData.nurseTask,
      MockUpData.nurseTask,
      MockUpData.nurseTask,
    ];

    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: nurseTaskList.length,
        itemBuilder: (context, index) {
          NurseTaskModel nurseTask = nurseTaskList[index];
          // return WidgetRestaurant(restaurant: restaurant);
          return NurseTaskView(nurseTask: nurseTask);
        },
      ),
    );
  }
}
