import 'dart:math';

import 'package:intern_nurse_application_v2/model/nurse_profile_model.dart';
import 'package:intern_nurse_application_v2/model/nurse_task_model.dart';
import 'package:intern_nurse_application_v2/model/patient_lab_model.dart';
import 'package:intern_nurse_application_v2/model/patient_profile_model.dart';
import 'package:intern_nurse_application_v2/model/view/activity_detail_view_model.dart';
import 'package:intern_nurse_application_v2/model/view/activity_view_model.dart';
import 'package:sprintf/sprintf.dart';

class MockUpData {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  const MockUpData._();

  static final Random _random = Random();

  static final PatientProfileModel patientProfile = PatientProfileModel(
    name: "TONO",
    birthDate: "10-JUL-2000",
    phoneNumber: "00112233",
    braceletId: "BLUE",
    roomId: "KENANGA",
    bedId: "01",
    doctorInCharge: "BAMBANG",
    checkInDate: "10-JUN-2022",
    nutritionId: "MAKAN LUNAK",
    preferredMealBreakfast: "BUBUR",
    preferredMealLunch: "INDONESIAN",
    preferredMealDinner: "WESTERN",
    preferredMealSnack: "DONUT",
    preferredMealBeverage: "CHOCOLATE",
    preferredMealFruit: "TROPICAL FRUIT",
  );

  static final NurseTaskModel nurseTask = NurseTaskModel(
    orderId: "001",
    orderDate: "10-JUL-2022",
    orderTime: "10:12",
    patientId: "BUDI",
    roomId: "CEMARA",
    bedId: "03",
    nurseId: "TYAS",
    orderTypeId: "SMART ORDER",
    orderName: "MINTA KURSI RODA",
    status: "NEW",
  );

  // static final NurseProfileModel nurseProfile = NurseProfileModel(
  //   name: "ELIS",
  //   birthDate: "**-***-****",
  //   phoneNumber: "0821-217-536-24",
  //   campus: "Universitas Bhakti Kencana",
  //   educationMajor: "S1 Keperawatan",
  //   email: "elistrisnawati98@gmail.com",
  //   internHospital: "RSUD Dr. Soekarjo Tasikmalaya",
  //   clinicInstructor: "Ns. Asep Mulyana",
  // );

  static final PatientLabModel patientLabNormal = PatientLabModel(
    orderId: "999",
    orderDate: "10-JUL-2022",
    orderTime: "12:12",
    patientId: "BUDI",
    labItem: "ABC",
    labDescription: "CEK KOLESTEROL",
    normalValue: "< 100.0",
    resultValue: "90.0",
    resultStatus: "NORMAL",
  );

  static final PatientLabModel patientLabWarning = PatientLabModel(
    orderId: "999",
    orderDate: "10-JUL-2022",
    orderTime: "12:12",
    patientId: "BUDI",
    labItem: "ABC",
    labDescription: "CEK KOLESTEROL",
    normalValue: "< 100.0",
    resultValue: "110.0",
    resultStatus: "WARNING",
  );

  static final List<String> _locationList = [
    "R. KENANGA",
    "R. TULIP",
    "R. MAWAR",
    "ICU",
    "NICU",
    "PERINATOLOGI",
    "M.1A",
    "M.2A",
    "M.3A",
  ];

  static final List<String> _activityDescriptionList = [
    "TTV",
    "PEMFIS NIFAS",
    "PEMERIKSAAN LEOPOID",
    "ANTAR PASIEN USG",
    "UP INFUS",
    "GANTI CAIRAN INFUS",
    "PERBEDEN",
    "MEMINDAHKAN PASIEN KE KURSI RODA",
    "PENGKAJIAN DAN ANAMNESA",
    "MEMBENARKAN INFUS MACET",
    "VULVA HYGIENE",
    "PEMERIKSAAN CAIRAN KETUBAN",
  ];

  static final List<String> dayList = [
    "SENIN",
    "SELASA",
    "RABU",
    "KAMIS",
    "JUMAT",
    "SABTU",
    "MINGGU",
  ];

  static List<ActivityViewModel> buildActivityList() {
    List<ActivityViewModel> activityModelList = [];

    for (int i = 1; i <= 10; i++) {
      String monthYear = "FEBRUARY 2022";
      String date = "$i".padLeft(2, "0");
      String day = dayList[i % 7];
      List<ActivityDetailModel> activityDetailList = [];

      int hour = 8 + _random.nextInt(3);
      int minute = 0 + _random.nextInt(60);

      int totalActivity = 30 + _random.nextInt(10);
      for (int j = 0; j < totalActivity; j++) {
        String time = generateTime(hour: hour, minute: minute);
        int nextMinute = _random.nextInt(20) + minute;
        minute = nextMinute % 60;
        hour += nextMinute ~/ 60;

        String location = _locationList[_random.nextInt(_locationList.length)];
        String description = _activityDescriptionList[
            _random.nextInt(_activityDescriptionList.length)];

        activityDetailList.add(ActivityDetailModel(
            time: time, location: location, description: description));
      }

      ActivityViewModel activity = ActivityViewModel(
          date: date,
          monthYear: monthYear,
          day: day,
          activityDetailList: activityDetailList);
      activityModelList.add(activity);
    }

    return activityModelList;
  }

  static String generateTime({int hour = -1, int minute = -1}) {
    if (hour < 0) {
      hour = _random.nextInt(24);
    }
    if (minute < 0) {
      minute = _random.nextInt(60);
    }

    return sprintf("%02d:%02d", [hour, minute]);
  }
}
