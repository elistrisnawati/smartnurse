import "package:flutter/material.dart";
import 'package:intern_nurse_application_v2/view/meal/meal_item.dart';
import 'package:intern_nurse_application_v2/view/util/title_text.dart';

// to make the standar bottom navigation
class MealGroup extends StatelessWidget {
  final String mealId;

  final List<String> mealContentList;

  final String selectedMeal;

  const MealGroup({
    required this.mealId,
    required this.mealContentList,
    required this.selectedMeal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MealItem> arrangedMealItemList = List.empty(growable: true);
    arrangedMealItemList.add(MealItem(
      mealGroup: mealId,
      mealItem: selectedMeal,
      selected: true,
    ));
    arrangedMealItemList.addAll(mealContentList
        .where((element) => element != selectedMeal)
        .map((e) => MealItem(
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
