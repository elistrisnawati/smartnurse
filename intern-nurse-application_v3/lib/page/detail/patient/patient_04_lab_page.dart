import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v3/data/result_state.dart';
import 'package:intern_nurse_application_v3/model/patient_lab_model.dart';
import 'package:intern_nurse_application_v3/model/rest/composite_output.dart';
import 'package:intern_nurse_application_v3/util/provider/patient_lab_provider.dart';
import 'package:intern_nurse_application_v3/view/lab/lab_view.dart';
import 'package:intern_nurse_application_v3/view/provider/error_provider.dart';
import 'package:intern_nurse_application_v3/view/provider/loading_provider.dart';
import 'package:provider/provider.dart';

class PatientLabPage extends StatelessWidget {
  const PatientLabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientLabProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.hasData) {
          List<CompositeResultList> compositeResultList = state.result;

          List<PatientLabModel> patientLabList = compositeResultList.map((e) {
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
