import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v2/data/constant_data.dart';
import 'package:intern_nurse_application_v2/page/home/login_page.dart';
import 'package:intern_nurse_application_v2/page/home/nurse_page.dart';
import 'package:intern_nurse_application_v2/page/home/patient_page.dart';
import 'package:intern_nurse_application_v2/util/shared_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Widget? _activeWidget;

  late LoginPage _loginPage;
  late NursePage _nursePage;
  late PatientPage _patienPage;

  _HomePage() {
    _loginPage = LoginPage(
      functionNurse: _goToNurse,
      functionPatient: _goToPatient,
    );
    _nursePage = NursePage(
      functionExit: _goToLogin,
    );
    _patienPage = PatientPage(
      functionExit: _goToLogin,
    );

    _activeWidget = _loginPage;
  }

  void _goToLogin() {
    setState(() {
      _activeWidget = _loginPage;
    });
  }

  void _goToNurse() {
    setState(() {
      _activeWidget = _nursePage;
    });
  }

  void _goToPatient() {
    setState(() {
      _activeWidget = _patienPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _activeWidget,
      ),
    );
  }
}
