import "package:flutter/material.dart";
import 'package:intern_nurse_application_v2/model/view/navigation_item_model.dart';

// to make the standar bottom navigation
class BottomNavigationView extends StatelessWidget {
  final List<NavigationItemModel> navigationItemList;
  final Function(int) tapFunction;
  final int selectedIndex;

  const BottomNavigationView({
    required this.navigationItemList,
    required this.tapFunction,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.blue,
      onTap: tapFunction,
      type: BottomNavigationBarType.fixed,
      items: navigationItemList
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.title,
              ))
          .toList(),
    );
  }
}
