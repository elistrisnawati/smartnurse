import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v3/data/constant_data.dart';
import 'package:intern_nurse_application_v3/data/result_state.dart';
import 'package:intern_nurse_application_v3/model/patient_profile_model.dart';
import 'package:intern_nurse_application_v3/util/provider/patient_meal_order_provider.dart';
import 'package:intern_nurse_application_v3/view/meal/meal_group.dart';
import 'package:intern_nurse_application_v3/view/provider/error_provider.dart';
import 'package:intern_nurse_application_v3/view/provider/loading_provider.dart';
import 'package:provider/provider.dart';

class PatientMealOrderPage extends StatelessWidget {
  final PatientMealOrderProvider provider;

  const PatientMealOrderPage({required this.provider, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientMealOrderProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.hasData) {
          Map<String, dynamic> contentMap = state.result;

          PatientProfileModel profile = PatientProfileModel(
            name: contentMap["name"],
            birthDate: contentMap["birthDate"],
            phoneNumber: contentMap["phoneNumber"],
            braceletId: contentMap["braceletId"],
            roomId: contentMap["roomId"],
            bedId: contentMap["bedId"],
            doctorInCharge: contentMap["doctorInCharge"],
            checkInDate: contentMap["checkInDate"],
            nutritionId: contentMap["nutritionId"],
            preferredMealBreakfast: contentMap["preferredMealBreakfast"],
            preferredMealLunch: contentMap["preferredMealLunch"],
            preferredMealDinner: contentMap["preferredMealDinner"],
            preferredMealSnack: contentMap["preferredMealSnack"],
            preferredMealBeverage: contentMap["preferredMealBeverage"],
            preferredMealFruit: contentMap["preferredMealFruit"],
          );

          return _build(profile);
        } else if (state.state == ResultState.loading) {
          return const LoadingProviderView();
        } else {
          return const ErrorProviderView();
        }
      },
    );
  }

  Widget _build(PatientProfileModel patientProfileModel) {
    return Scaffold(
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MealGroup(
                provider: provider,
                mealId: "Breakfast",
                selectedMeal: patientProfileModel.preferredMealBreakfast,
                mealContentList: ConstantData.breakfastList),
            MealGroup(
              provider: provider,
              mealId: "Lunch",
              selectedMeal: patientProfileModel.preferredMealLunch,
              mealContentList: ConstantData.lunchList,
            ),
            MealGroup(
              provider: provider,
              mealId: "Dinner",
              selectedMeal: patientProfileModel.preferredMealDinner,
              mealContentList: ConstantData.dinnerList,
            ),
            MealGroup(
              provider: provider,
              mealId: "Fruit",
              selectedMeal: patientProfileModel.preferredMealFruit,
              mealContentList: ConstantData.fruitList,
            ),
            MealGroup(
              provider: provider,
              mealId: "Beverage",
              selectedMeal: patientProfileModel.preferredMealBeverage,
              mealContentList: ConstantData.beverageList,
            ),
          ],
        ),
      ),
    );
  }
}
