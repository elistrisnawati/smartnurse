import 'package:flutter/material.dart';
import 'package:interns_nurse_application/data/constant_data.dart';
import 'package:interns_nurse_application/model/user_model.dart';
import 'package:interns_nurse_application/view/util/title_text.dart';
import 'package:interns_nurse_application/view/login/user_view.dart';

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
