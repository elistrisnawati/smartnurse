import 'package:flutter/material.dart';
import 'package:interns_nurse_application/page/detail/patient/patient_05_profile_page.dart';

class NursePatientPage extends StatelessWidget {
  final Function() functionExit;

  const NursePatientPage({
    required this.functionExit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: PageView.builder(
        controller: PageController(initialPage: 0, viewportFraction: 0.95),
        itemCount: 3,
        itemBuilder: (context, i) {
          return PatientProfilePage(
            showLogoutButton: false,
            functionExit: functionExit,
          );
        },
      ),
    );
  }
}
