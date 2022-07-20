class PatientProfileModel {
  final String name;
  final String birthDate;
  final String phoneNumber;
  final String braceletId;
  final String roomId;
  final String bedId;
  final String doctorInCharge;
  final String checkInDate;
  final String nutritionId;
  final String preferredMealBreakfast;
  final String preferredMealLunch;
  final String preferredMealDinner;
  final String preferredMealSnack;
  final String preferredMealBeverage;
  final String preferredMealFruit;

  PatientProfileModel({
    required this.name,
    required this.birthDate,
    required this.phoneNumber,
    required this.braceletId,
    required this.roomId,
    required this.bedId,
    required this.doctorInCharge,
    required this.checkInDate,
    required this.nutritionId,
    required this.preferredMealBreakfast,
    required this.preferredMealLunch,
    required this.preferredMealDinner,
    required this.preferredMealSnack,
    required this.preferredMealBeverage,
    required this.preferredMealFruit,
  });
}
