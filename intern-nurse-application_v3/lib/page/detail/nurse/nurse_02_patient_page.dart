import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v3/data/result_state.dart';
import 'package:intern_nurse_application_v3/model/patient_profile_model.dart';
import 'package:intern_nurse_application_v3/model/rest/composite_output.dart';
import 'package:intern_nurse_application_v3/util/provider/nurse_patient_provider.dart';
import 'package:intern_nurse_application_v3/view/patient_list/nurse_patient_view.dart';
import 'package:intern_nurse_application_v3/view/provider/error_provider.dart';
import 'package:intern_nurse_application_v3/view/provider/loading_provider.dart';
import 'package:provider/provider.dart';

class NursePatientPage extends StatelessWidget {
  final Function() functionExit;

  const NursePatientPage({
    required this.functionExit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NursePatientProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.hasData) {
          List<CompositeResultList> compositeResultList = state.result;

          List<PatientProfileModel> patientList = compositeResultList.map((e) {
            Map<String, dynamic> contentMap = e.contentMap;
            return PatientProfileModel(
              name: contentMap["name"] ?? "",
              birthDate: contentMap["birthDate"] ?? "",
              phoneNumber: contentMap["phoneNumber"] ?? "",
              braceletId: contentMap["braceletId"] ?? "",
              roomId: contentMap["roomId"] ?? "",
              bedId: contentMap["bedId"] ?? "",
              doctorInCharge: contentMap["doctorInCharge"] ?? "",
              checkInDate: contentMap["checkInDate"] ?? "",
              nutritionId: contentMap["nutritionId"] ?? "",
              preferredMealBreakfast:
                  contentMap["preferredMealBreakfast"] ?? "",
              preferredMealLunch: contentMap["preferredMealLunch"] ?? "",
              preferredMealDinner: contentMap["preferredMealDinner"] ?? "",
              preferredMealSnack: contentMap["preferredMealSnack"] ?? "",
              preferredMealBeverage: contentMap["preferredMealBeverage"] ?? "",
              preferredMealFruit: contentMap["preferredMealFruit"] ?? "",
            );
          }).toList();

          return _build(patientList);
        } else if (state.state == ResultState.loading) {
          return const LoadingProviderView();
        } else {
          return const ErrorProviderView();
        }
      },
    );
  }

  Widget _build(List<PatientProfileModel> patientList) {
    return Scaffold(
      drawer: const Drawer(),
      body: PageView.builder(
        controller: PageController(initialPage: 0, viewportFraction: 0.95),
        itemCount: patientList.length,
        itemBuilder: (context, i) {
          return NursePatientView(
            profile: patientList[i],
          );
        },
      ),
    );
  }
}
