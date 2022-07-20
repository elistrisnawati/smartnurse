import "package:flutter/material.dart";
import 'package:intern_nurse_application_v3/data/api_constant.dart';
import 'package:intern_nurse_application_v3/data/constant_data.dart';
import 'package:intern_nurse_application_v3/model/view/navigation_item_model.dart';
import 'package:intern_nurse_application_v3/page/detail/patient/patient_01_request_page.dart';
import 'package:intern_nurse_application_v3/page/detail/patient/patient_02_medication_page.dart';
import 'package:intern_nurse_application_v3/page/detail/patient/patient_03_meal_order_page.dart';
import 'package:intern_nurse_application_v3/page/detail/patient/patient_04_lab_page.dart';
import 'package:intern_nurse_application_v3/page/detail/patient/patient_05_profile_page.dart';
import 'package:intern_nurse_application_v3/util/api_service.dart';
import 'package:intern_nurse_application_v3/util/provider/patient_lab_provider.dart';
import 'package:intern_nurse_application_v3/util/provider/patient_meal_order_provider.dart';
import 'package:intern_nurse_application_v3/util/provider/patient_medication_provider.dart';
import 'package:intern_nurse_application_v3/util/provider/patient_profile_provider.dart';
import 'package:intern_nurse_application_v3/view/util/buttom_navigation_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientPage extends StatefulWidget {
  final Function() functionExit;

  const PatientPage({
    required this.functionExit,
    Key? key,
  }) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _user = "";

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    _user = prefs.getString("user") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (context, snapshot) {
        // document provider
        PatientMealOrderProvider mealProvider = PatientMealOrderProvider(
          apiService: ApiService(),
          secretKey: ApiConstant.secretKeyPatient,
          uniqueId: _user,
        );

        // widget
        List<Widget> widgetOptions = <Widget>[
          const PatientRequestPage(),
          ChangeNotifierProvider<PatientMedicationProvider>(
            create: (_) => PatientMedicationProvider(
              apiService: ApiService(),
              secretKey: ApiConstant.secretKeyActivity,
              uniqueId: _user,
            ),
            child: const PatientMedicationPage(),
          ),
          ChangeNotifierProvider<PatientMealOrderProvider>(
            create: (_) => mealProvider,
            child: PatientMealOrderPage(
              provider: mealProvider,
            ),
          ),
          ChangeNotifierProvider<PatientLabProvider>(
            create: (_) => PatientLabProvider(
              apiService: ApiService(),
              secretKey: ApiConstant.secretKeyLab,
              uniqueId: _user,
            ),
            child: const PatientLabPage(),
          ),
          ChangeNotifierProvider<PatientProfileProvider>(
            create: (_) => PatientProfileProvider(
              apiService: ApiService(),
              secretKey: ApiConstant.secretKeyPatient,
              uniqueId: _user,
            ),
            child: PatientProfilePage(
              showLogoutButton: true,
              functionExit: widget.functionExit,
            ),
          ),
        ];

        return Scaffold(
          appBar: AppBar(
            title: const Text(ConstantData.textTitle,
                style: TextStyle(
                  fontSize: 25.0,
                )),
          ),
          body: Center(
            child: widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationView(
            navigationItemList: [
              NavigationItemModel(icon: Icons.vaccines, title: "Request"),
              NavigationItemModel(icon: Icons.medication, title: "Medication"),
              NavigationItemModel(icon: Icons.dining, title: "Meal"),
              NavigationItemModel(icon: Icons.biotech, title: "Lab"),
              NavigationItemModel(icon: Icons.person, title: "Profile"),
            ],
            tapFunction: _onItemTapped,
            selectedIndex: _selectedIndex,
          ),
        );
      },
    );
  }
}
