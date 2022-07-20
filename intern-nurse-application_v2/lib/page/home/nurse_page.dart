import "package:flutter/material.dart";
import 'package:intern_nurse_application_v2/data/api_constant.dart';
import 'package:intern_nurse_application_v2/data/constant_data.dart';
import 'package:intern_nurse_application_v2/data/mock_up_data.dart';
import 'package:intern_nurse_application_v2/model/nurse_profile_model.dart';
import 'package:intern_nurse_application_v2/model/view/activity_view_model.dart';
import 'package:intern_nurse_application_v2/model/view/navigation_item_model.dart';
import 'package:intern_nurse_application_v2/page/detail/nurse/nurse_01_task_page.dart';
import 'package:intern_nurse_application_v2/page/detail/nurse/nurse_02_patient_page.dart';
import 'package:intern_nurse_application_v2/page/detail/nurse/nurse_03_activity_page.dart';
import 'package:intern_nurse_application_v2/page/detail/nurse/nurse_04_profile_page.dart';
import 'package:intern_nurse_application_v2/util/api_service.dart';
import 'package:intern_nurse_application_v2/util/document_provider.dart';
import 'package:intern_nurse_application_v2/view/util/buttom_navigation_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class NursePage extends StatefulWidget {
  final List<ActivityViewModel> activityModelList =
      MockUpData.buildActivityList();

  final Function() functionExit;

  NursePage({
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
          List<Widget> _widgetOptions = <Widget>[
            const NurseTaskPage(),
            NursePatientPage(
              functionExit: widget.functionExit,
            ),
            NurseActivityPage(activityList: widget.activityModelList),
            ChangeNotifierProvider<DocumentProvider>(
              create: (_) => DocumentProvider(
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
              child: _widgetOptions.elementAt(_selectedIndex),
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
