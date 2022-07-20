import "package:flutter/material.dart";
import 'package:interns_nurse_application/data/result_state.dart';
import "package:interns_nurse_application/model/nurse_profile_model.dart";
import 'package:interns_nurse_application/util/document_provider.dart';
import "package:interns_nurse_application/view/profile_component_view.dart";
import 'package:interns_nurse_application/view/provider/error_provider.dart';
import 'package:interns_nurse_application/view/provider/loading_provider.dart';
import 'package:interns_nurse_application/view/util/icon_logout.dart';
import 'package:provider/provider.dart';

class NurseProfilePage extends StatelessWidget {
  final Function() functionExit;

  const NurseProfilePage({
    required this.functionExit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.hasData) {
          Map<String, dynamic> contentMap = state.result;

          NurseProfileModel profile = NurseProfileModel(
            name: contentMap["name"],
            birthDate: contentMap["birthDate"],
            phoneNumber: contentMap["phoneNumber"],
            campus: contentMap["campus"],
            educationMajor: contentMap["educationMajor"],
            email: contentMap["email"],
            internHospital: contentMap["internHospital"],
            clinicInstructor: contentMap["clinicInstructor"],
          );

          return _build(profile);
        } else if (state.state == ResultState.loading) {
          return const LoadingProviderView();
        } else {
          return const ErrorProviderView();
        }
      },
    );
  }

  Widget _build(NurseProfileModel profile) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blueAccent, Colors.lightBlueAccent])),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              "./assets/images/user/" + profile.name + ".jpg"),
                          radius: 50.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          profile.name,
                          style: const TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          profile.phoneNumber,
                          style: const TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
            child: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 60.0),
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // EDUCATION
                      ProfileComponentView(
                          caption: "Education Information",
                          value:
                              profile.educationMajor + "\n" + profile.campus),
                      // EMAIL
                      ProfileComponentView(
                          caption: "e-Mail", value: profile.email),
                      // BIRTH DATE
                      ProfileComponentView(
                          caption: "Birthdate", value: profile.birthDate),
                      // BIRTH DATE
                      ProfileComponentView(
                          caption: "Intern Hospital",
                          value: profile.internHospital),
                      // BIRTH DATE
                      ProfileComponentView(
                          caption: "Clinic Instructor",
                          value: profile.clinicInstructor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconLogout(
                            functionExit: functionExit,
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
