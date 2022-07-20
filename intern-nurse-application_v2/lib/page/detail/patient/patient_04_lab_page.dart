import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v2/data/result_state.dart';
import 'package:intern_nurse_application_v2/model/patient_lab_model.dart';
import 'package:intern_nurse_application_v2/model/rest/composite_output.dart';
import 'package:intern_nurse_application_v2/util/composite_provider.dart';
import 'package:intern_nurse_application_v2/view/lab/lab_view.dart';
import 'package:intern_nurse_application_v2/view/provider/error_provider.dart';
import 'package:intern_nurse_application_v2/view/provider/loading_provider.dart';
import 'package:provider/provider.dart';

class PatientLabPage extends StatelessWidget {
  const PatientLabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CompositeProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.hasData) {
          List<CompositeResultList> contentMap = state.result;

          print(state.result[0].contentMap.keys);

          List<PatientLabModel> patientLabList = contentMap.map((e) {
            return PatientLabModel(
                orderId: e.contentMap["orderId"],
                orderDate: e.contentMap["orderDate"],
                orderTime: e.contentMap["orderTime"],
                patientId: e.contentMap["patientId"],
                labItem: e.contentMap["labItem"],
                labDescription: e.contentMap["labDescription"],
                resultValue: e.contentMap["resultValue"],
                normalValue: e.contentMap["normalValue"],
                resultStatus: e.contentMap["resultStatus"]);
          }).toList();

          return _build(patientLabList);
        } else if (state.state == ResultState.loading) {
          return const LoadingProviderView();
        } else {
          return const ErrorProviderView();
        }
      },
    );
  }

  Widget _build(List<PatientLabModel> patientLabList) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: patientLabList.length,
        itemBuilder: (context, index) {
          PatientLabModel patientLab = patientLabList[index];
          return PatientLabView(patientLab: patientLab);
        },
      ),
    );
  }
}
