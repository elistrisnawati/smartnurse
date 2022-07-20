import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v3/data/constant_data.dart';
import 'package:intern_nurse_application_v3/model/user_model.dart';
import 'package:intern_nurse_application_v3/view/login/user_view.dart';
import 'package:intern_nurse_application_v3/view/util/title_text.dart';

class LoginPage extends StatelessWidget {
  final Function() functionNurse;
  final Function() functionPatient;

  const LoginPage({
    required this.functionNurse,
    required this.functionPatient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel patient1 = UserModel(
        userId: "TONO",
        name: "TONO",
        role: "PATIENT",
        imageUrl: "assets/images/user/TONO.jpg");

    UserModel patient2 = UserModel(
        userId: "YENI",
        name: "YENI",
        role: "PATIENT",
        imageUrl: "assets/images/user/YENI.jpg");

    UserModel nurse1 = UserModel(
        userId: "ELIS",
        name: "ELIS",
        role: "NURSE",
        imageUrl: "assets/images/user/ELIS.jpg");

    UserModel nurse2 = UserModel(
        userId: "SUSAN",
        name: "SUSAN",
        role: "NURSE",
        imageUrl: "assets/images/user/SUSAN.jpg");

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const TitleText(text: ConstantData.headerUserViewNurse),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              UserView(user: nurse1, goToFunction: functionNurse),
              UserView(user: nurse2, goToFunction: functionNurse),
            ],
          ),
          const TitleText(text: ConstantData.headerUserViewPatient),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              UserView(user: patient1, goToFunction: functionPatient),
              UserView(user: patient2, goToFunction: functionPatient),
            ],
          ),
        ],
      ),
    );
  }
}
