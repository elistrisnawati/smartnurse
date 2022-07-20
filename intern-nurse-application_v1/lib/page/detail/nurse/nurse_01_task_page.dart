import 'package:flutter/material.dart';
import 'package:interns_nurse_application/data/mock_up_data.dart';
import 'package:interns_nurse_application/model/nurse_task_model.dart';
import 'package:interns_nurse_application/view/task/task_view.dart';

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
