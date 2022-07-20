import "package:flutter/material.dart";
import 'package:interns_nurse_application/data/api_constant.dart';
import 'package:interns_nurse_application/data/constant_data.dart';
import 'package:interns_nurse_application/data/mock_up_data.dart';
import 'package:interns_nurse_application/model/patient_profile_model.dart';
import 'package:interns_nurse_application/model/view/activity_view_model.dart';
import 'package:interns_nurse_application/model/view/navigation_item_model.dart';
import 'package:interns_nurse_application/page/detail/patient/patient_01_request_page.dart';
import 'package:interns_nurse_application/page/detail/patient/patient_02_medication_page.dart';
import 'package:interns_nurse_application/page/detail/patient/patient_03_meal_order_page.dart';
import 'package:interns_nurse_application/page/detail/patient/patient_04_lab_page.dart';
import 'package:interns_nurse_application/page/detail/patient/patient_05_profile_page.dart';
import 'package:interns_nurse_application/util/api_service.dart';
import 'package:interns_nurse_application/util/composite_provider.dart';
import 'package:interns_nurse_application/util/document_provider.dart';
import 'package:interns_nurse_application/view/util/buttom_navigation_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientPage extends StatefulWidget {
  // MOCK UP DATA
  final PatientProfileModel profile = MockUpData.patientProfile;
  final List<ActivityViewModel> activityModelList =
      MockUpData.buildActivityList();

  final Function() functionExit;

  PatientPage({
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
        List<Widget> _widgetOptions = <Widget>[
          const PatientRequestPage(),
          const PatientMedicationPage(),
          const PatientMealOrderPage(),
          ChangeNotifierProvider<CompositeProvider>(
            create: (_) => CompositeProvider(
              apiService: ApiService(),
              secretKey: ApiConstant.secretKeyLab,
              uniqueId: _user,
            ),
            child: const PatientLabPage(),
          ),
          ChangeNotifierProvider<DocumentProvider>(
            create: (_) => DocumentProvider(
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
            child: _widgetOptions.elementAt(_selectedIndex),
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
