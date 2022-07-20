import "package:flutter/material.dart";
import 'package:interns_nurse_application/data/mock_up_data.dart';
import 'package:interns_nurse_application/data/result_state.dart';
import 'package:interns_nurse_application/model/patient_profile_model.dart';
import 'package:interns_nurse_application/util/document_provider.dart';
import "package:interns_nurse_application/view/profile_component_view.dart";
import 'package:interns_nurse_application/view/provider/error_provider.dart';
import 'package:interns_nurse_application/view/provider/loading_provider.dart';
import 'package:interns_nurse_application/view/util/icon_logout.dart';
import 'package:provider/provider.dart';

class PatientProfilePage extends StatelessWidget {
  final bool showLogoutButton;
  final Function() functionExit;

  const PatientProfilePage({
    required this.showLogoutButton,
    required this.functionExit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.hasData) {
          Map<String, dynamic> contentMap = state.result;

          PatientProfileModel profile = PatientProfileModel(
            name: contentMap["name"],
            birthDate: contentMap["birthDate"],
            phoneNumber: contentMap["phoneNumber"],
            braceletId: contentMap["braceletId"],
            roomId: contentMap["roomId"],
            bedId: contentMap["bedId"],
            doctorInCharge: contentMap["doctorInCharge"],
            checkInDate: contentMap["checkInDate"],
            nutritionId: contentMap["nutritionId"],
            preferredMealBreakfast: contentMap["preferredMealBreakfast"],
            preferredMealLunch: contentMap["preferredMealLunch"],
            preferredMealDinner: contentMap["preferredMealDinner"],
            preferredMealSnack: contentMap["preferredMealSnack"],
            preferredMealBeverage: contentMap["preferredMealBeverage"],
            preferredMealFruit: contentMap["preferredMealFruit"],
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

  @override
  Widget _build(PatientProfileModel profile) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  width: 2,
                  color: _getColor(profile.braceletId),
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18),
                      bottom: Radius.circular(0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                    ),
                  ),
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
                                  "./assets/images/user/" +
                                      profile.name +
                                      ".jpg"),
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
                  ),
                ),
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
                              caption: "Room  / Bed",
                              value: profile.roomId + " " + profile.bedId),
                          // EMAIL
                          ProfileComponentView(
                              caption: "Doctor in Charge",
                              value: profile.doctorInCharge),
                          // Bracelet Color
                          ProfileComponentView(
                              caption: "Bracelet Color",
                              value: profile.braceletId),
                          // Check in Date
                          ProfileComponentView(
                              caption: "Check in Date",
                              value: profile.checkInDate),
                          // MEAL
                          ProfileComponentView(
                              caption: "Nutrition", value: profile.nutritionId),
                          // MEAL
                          ProfileComponentView(
                            caption: "Preferred Meal",
                            value:
                                // breakfast
                                "BF: " +
                                    profile.preferredMealBreakfast +
                                    "\n" +
                                    // lunch
                                    "LN: " +
                                    profile.preferredMealLunch +
                                    "\n" +
                                    // dinner
                                    "DN: " +
                                    profile.preferredMealDinner +
                                    "\n" +
                                    // fruit
                                    "FR: " +
                                    profile.preferredMealFruit +
                                    "\n" +
                                    // snack
                                    "SN: " +
                                    profile.preferredMealSnack +
                                    "\n" +
                                    // beverage
                                    "BV: " +
                                    profile.preferredMealBeverage,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              showLogoutButton
                                  ? IconLogout(functionExit: functionExit)
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Color _getColor(String braceletId) {
    switch (braceletId) {
      case "RED":
        return Colors.red;
      case "BLUE":
        return Colors.blue;
      case "PINK":
        return Colors.pink;
    }
    return Colors.black;
  }
}
