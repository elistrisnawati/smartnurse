import "package:flutter/material.dart";
import 'package:intern_nurse_application_v3/data/result_state.dart';
import 'package:intern_nurse_application_v3/model/patient_profile_model.dart';
import 'package:intern_nurse_application_v3/util/provider/patient_profile_provider.dart';
import "package:intern_nurse_application_v3/view/profile_component_view.dart";
import 'package:intern_nurse_application_v3/view/provider/error_provider.dart';
import 'package:intern_nurse_application_v3/view/provider/loading_provider.dart';
import 'package:intern_nurse_application_v3/view/util/icon_logout.dart';
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
    return Consumer<PatientProfileProvider>(
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
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                      bottom: Radius.circular(0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: _getColorAccent(profile.braceletId),
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
                                  "./assets/images/user/${profile.name}.jpg"),
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
                              value: "${profile.roomId} ${profile.bedId}"),
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
                                "BF: ${profile.preferredMealBreakfast}\nLN: ${profile.preferredMealLunch}\nDN: ${profile.preferredMealDinner}\nFR: ${profile.preferredMealFruit}\nSN: ${profile.preferredMealSnack}\nBV: ${profile.preferredMealBeverage}",
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

  List<Color> _getColorAccent(String braceletId) {
    switch (braceletId) {
      case "RED":
        return [Colors.red, Colors.redAccent];
      case "BLUE":
        return [Colors.blue, Colors.blueAccent];
      case "PINK":
        return [Colors.pink, Colors.pinkAccent];
      case "GREEN":
        return [Colors.green, Colors.greenAccent];
      case "YELLOW":
        return [Colors.yellow, Colors.yellowAccent];
    }
    return [Colors.black38, Colors.black12];
  }

  Color _getColor(String braceletId) {
    switch (braceletId) {
      case "RED":
        return Colors.red;
      case "BLUE":
        return Colors.blue;
      case "PINK":
        return Colors.pink;
      case "GREEN":
        return Colors.green;
      case "YELLOW":
        return Colors.yellow;
    }
    return Colors.black;
  }
}
