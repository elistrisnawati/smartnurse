import "package:flutter/material.dart";
import 'package:intern_nurse_application_v3/data/api_constant.dart';
import 'package:intern_nurse_application_v3/data/constant_data.dart';
import 'package:intern_nurse_application_v3/model/view/navigation_item_model.dart';
import 'package:intern_nurse_application_v3/page/detail/nurse/nurse_01_task_page.dart';
import 'package:intern_nurse_application_v3/page/detail/nurse/nurse_02_patient_page.dart';
import 'package:intern_nurse_application_v3/page/detail/nurse/nurse_03_activity_page.dart';
import 'package:intern_nurse_application_v3/page/detail/nurse/nurse_04_profile_page.dart';
import 'package:intern_nurse_application_v3/util/api_service.dart';
import 'package:intern_nurse_application_v3/util/provider/nurse_activity_provider.dart';
import 'package:intern_nurse_application_v3/util/provider/nurse_patient_provider.dart';
import 'package:intern_nurse_application_v3/util/provider/nurse_profile_provider.dart';
import 'package:intern_nurse_application_v3/util/provider/nurse_task_provider.dart';
import 'package:intern_nurse_application_v3/view/util/buttom_navigation_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NursePage extends StatefulWidget {
  final Function() functionExit;

  const NursePage({
    required this.functionExit,
    Key? key,
  }) : super(key: key);

  @override
  State<NursePage> createState() => _NursePageState();
}

class _NursePageState extends State<NursePage> {
  int _selectedIndex = 0;
  String _user = "";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    _user = prefs.getString("user") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          NurseTaskProvider nurseTaskProvider = NurseTaskProvider(
            apiService: ApiService(),
            secretKey: ApiConstant.secretKeyNurseTask,
            uniqueId: "",
          );

          // widget
          List<Widget> widgetOptions = <Widget>[
            ChangeNotifierProvider<NurseTaskProvider>(
              create: (_) => nurseTaskProvider,
              child: NurseTaskPage(
                provider: nurseTaskProvider,
              ),
            ),
            ChangeNotifierProvider<NursePatientProvider>(
              create: (_) => NursePatientProvider(
                apiService: ApiService(),
                secretKey: ApiConstant.secretKeyPatient,
                uniqueId: "",
              ),
              child: NursePatientPage(
                functionExit: widget.functionExit,
              ),
            ),
            ChangeNotifierProvider<NurseActivityProvider>(
              create: (_) => NurseActivityProvider(
                apiService: ApiService(),
                secretKey: ApiConstant.secretKeyActivity,
                uniqueId: _user,
              ),
              child: const NurseActivityPage(),
            ),
            ChangeNotifierProvider<NurseProfileProvider>(
              create: (_) => NurseProfileProvider(
                apiService: ApiService(),
                secretKey: ApiConstant.secretKeyNurse,
                uniqueId: _user,
              ),
              child: NurseProfilePage(
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
                NavigationItemModel(
                    icon: Icons.my_library_books, title: "Task"),
                NavigationItemModel(
                    icon: Icons.local_hospital_sharp, title: "Patient"),
                NavigationItemModel(
                    icon: Icons.schedule_sharp, title: "Activity"),
                NavigationItemModel(icon: Icons.person, title: "Profile"),
              ],
              tapFunction: _onItemTapped,
              selectedIndex: _selectedIndex,
            ),
          );
        });
  }
}
