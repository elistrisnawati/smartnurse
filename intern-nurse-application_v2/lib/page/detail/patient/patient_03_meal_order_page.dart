import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v2/view/meal/meal_group.dart';

class PatientMealOrderPage extends StatelessWidget {
  const PatientMealOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MealGroup(
                mealId: "BREAKFAST",
                selectedMeal: "TELUR",
                mealContentList: [
                  "TELUR",
                  "BUBUR",
                  "NASI UDUK",
                  "ROTI",
                ]),
            MealGroup(
              mealId: "LUNCH",
              selectedMeal: "STEAK",
              mealContentList: [
                "IKAN",
                "KATSU",
                "STEAK",
                "NASI PADANG",
                "NASI SOTO",
                "NASI CAPCAY",
              ],
            ),
            MealGroup(
              mealId: "DINNER",
              selectedMeal: "NASI SOTO",
              mealContentList: [
                "IKAN",
                "KATSU",
                "STEAK",
                "NASI PADANG",
                "NASI SOTO",
                "NASI CAPCAY",
              ],
            ),
            MealGroup(
              mealId: "FRUIT",
              selectedMeal: "ORANGE",
              mealContentList: [
                "BEET",
                "APPLE",
                "ORANGE",
                "TURMERIC",
                "GRAPE",
              ],
            ),
            MealGroup(
              mealId: "BEVERAGE",
              selectedMeal: "TEH",
              mealContentList: [
                "KOPI SUSU",
                "KOPI HITAM",
                "SUSU COKLAT",
                "TEH",
              ],
            ),
          ],
        ),
      ),
    );
  }
}
