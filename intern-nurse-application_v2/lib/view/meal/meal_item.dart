import "package:flutter/material.dart";
import 'package:intern_nurse_application_v2/main.dart';
import 'package:intern_nurse_application_v2/util/api_service.dart';
import 'package:intern_nurse_application_v2/util/notification_helper.dart';

// to make the standar bottom navigation
class MealItem extends StatelessWidget {
  final String mealGroup;
  final String mealItem;
  final bool selected;

  const MealItem({
    required this.mealGroup,
    required this.mealItem,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor color = selected ? Colors.green : Colors.grey;

    return GestureDetector(
      onTap: ()  async {
        print("TAP");
        await NotificationHelper().showNotification(flutterLocalNotificationsPlugin, "title", "message");
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage("assets/images/meal/" + mealItem + ".jpeg"),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: color,
                offset: const Offset(5, 5),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
