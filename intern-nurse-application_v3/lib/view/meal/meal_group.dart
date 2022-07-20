import "package:flutter/material.dart";
import 'package:intern_nurse_application_v3/util/provider/patient_meal_order_provider.dart';
import 'package:intern_nurse_application_v3/view/meal/meal_item.dart';
import 'package:intern_nurse_application_v3/view/util/title_text.dart';

// to make the standar bottom navigation
class MealGroup extends StatelessWidget {
  final String mealId;
  final List<String> mealContentList;
  final String selectedMeal;

  final PatientMealOrderProvider provider;

  const MealGroup({
    required this.provider,
    required this.mealId,
    required this.mealContentList,
    required this.selectedMeal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MealItem> arrangedMealItemList = List.empty(growable: true);
    // if (selectedMeal.isNotEmpty) {
    //   arrangedMealItemList.add(MealItem(
    //     provider: provider,
    //     mealGroup: mealId,
    //     mealItem: selectedMeal,
    //     selected: true,
    //   ));
    // }
    // arrangedMealItemList.addAll(mealContentList
    //     .where((element) => element != selectedMeal)
    //     .map((e) => MealItem(
    //           provider: provider,
    //           mealGroup: mealId,
    //           mealItem: e,
    //           selected: false,
    //         )));

    arrangedMealItemList.addAll(mealContentList
        // .where((element) => element != selectedMeal)
        .map((e) => MealItem(
              provider: provider,
              mealGroup: mealId,
              mealItem: e,
              selected: false,
            )));

    return Column(
      children: [
        Row(
          children: [
            TitleText(text: mealId),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: arrangedMealItemList,
          ),
        ),
      ],
    );
  }
}
