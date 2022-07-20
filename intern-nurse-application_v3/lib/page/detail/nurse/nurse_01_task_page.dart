import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v3/data/result_state.dart';
import 'package:intern_nurse_application_v3/model/nurse_task_model.dart';
import 'package:intern_nurse_application_v3/model/rest/composite_output.dart';
import 'package:intern_nurse_application_v3/util/provider/nurse_task_provider.dart';
import 'package:intern_nurse_application_v3/view/provider/error_provider.dart';
import 'package:intern_nurse_application_v3/view/provider/loading_provider.dart';
import 'package:intern_nurse_application_v3/view/task/task_view.dart';
import 'package:provider/provider.dart';

class NurseTaskPage extends StatelessWidget {
  final NurseTaskProvider provider;

  const NurseTaskPage({
    required this.provider,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NurseTaskProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.hasData) {
          List<CompositeResultList> compositeResultList = state.result;

          List<NurseTaskModel> nurseTaskList = compositeResultList.map((e) {
            return NurseTaskModel(
              orderId: e.contentMap["orderId"] ?? "",
              orderDate: e.contentMap["orderDate"] ?? "",
              orderTime: e.contentMap["orderTime"] ?? "",
              patientId: e.contentMap["patientId"] ?? "",
              roomId: e.contentMap["roomId"] ?? "",
              bedId: e.contentMap["bedId"] ?? "",
              nurseId: e.contentMap["nurseId"] ?? "",
              orderTypeId: e.contentMap["orderTypeId"] ?? "",
              orderName: e.contentMap["orderName"] ?? "",
              status: e.contentMap["status"] ?? "",
            );
          }).toList();

          return _build(nurseTaskList);
        } else if (state.state == ResultState.loading) {
          return const LoadingProviderView();
        } else {
          return const ErrorProviderView();
        }
      },
    );
  }

  Widget _build(List<NurseTaskModel> nurseTaskList) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: nurseTaskList.length,
        itemBuilder: (context, index) {
          NurseTaskModel nurseTask = nurseTaskList[index];
          return NurseTaskView(
            provider: provider,
            nurseTask: nurseTask,
          );
        },
      ),
    );
  }
}
