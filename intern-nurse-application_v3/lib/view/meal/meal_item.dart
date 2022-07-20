import "package:flutter/material.dart";
import 'package:intern_nurse_application_v3/data/activity_helper.dart';
import 'package:intern_nurse_application_v3/data/api_constant.dart';
import 'package:intern_nurse_application_v3/main.dart';
import 'package:intern_nurse_application_v3/util/api_service.dart';
import 'package:intern_nurse_application_v3/util/notification_helper.dart';
import 'package:intern_nurse_application_v3/util/provider/patient_meal_order_provider.dart';
import 'package:intern_nurse_application_v3/util/shared_helper.dart';

// to make the standar bottom navigation
class MealItem extends StatelessWidget {
  final String mealGroup;
  final String mealItem;
  final bool selected;

  final PatientMealOrderProvider provider;

  const MealItem({
    required this.provider,
    required this.mealGroup,
    required this.mealItem,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor color = selected ? Colors.green : Colors.grey;

    return GestureDetector(
      onTap: () async {
        String user = await SharedPreferencesHelper.getUser();

        await ApiService().update(
          secretKey: ApiConstant.secretKeyPatient,
          uniqueId: user,
          updatedData: {
            "preferredMeal$mealGroup": mealItem,
          },
        );

        await ActivityHelper.createActivity(
            user, "Meal for $mealGroup", "Confirm: $mealItem");

        await NotificationHelper().showNotification(
            flutterLocalNotificationsPlugin,
            mealGroup,
            "You choose $mealItem. Enjoy your food!!!");

        provider.load();
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
              image: AssetImage("assets/images/meal/$mealItem.jpeg"),

              // make shading
              // colorFilter: ColorFilter.mode(
              //     Colors.black.withOpacity(0.6), BlendMode.dstATop),

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
