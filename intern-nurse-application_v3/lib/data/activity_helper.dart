import 'package:intern_nurse_application_v3/data/api_constant.dart';
import 'package:intern_nurse_application_v3/util/api_service.dart';
import 'package:intl/intl.dart';

class ActivityHelper {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  const ActivityHelper._();

  static Future<void> createActivity(
      String userId, String header, String description) async {
    DateTime now = DateTime.now();
    String uniqueId = "${DateFormat("yyyyMMdd.HHmmss").format(now)}.$userId";

    String date = DateFormat("dd-MMM-yyyy").format(now);
    String day = DateFormat("EEEE").format(now);
    String time = DateFormat("hh:mm").format(now);
    String monthYear = DateFormat("MMMM yyyy").format(now);

    Map<String, dynamic> document = {
      "ACTIVE": true,
      "NAME": userId.toUpperCase(),
      "UNIQUE_ID": uniqueId.toUpperCase(),
      "date": date.toUpperCase(),
      "day": day.toUpperCase(),
      "time": time.toUpperCase(),
      "monthYear": monthYear.toUpperCase(),
      "description": description.toUpperCase(),
      "location": header.toUpperCase(),
      "userId": userId.toUpperCase(),
    };

    await ApiService().insert(
      secretKey: ApiConstant.secretKeyActivity,
      uniqueId: uniqueId,
      document: document,
    );
  }
}
