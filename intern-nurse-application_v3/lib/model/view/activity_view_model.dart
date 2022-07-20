import 'package:intern_nurse_application_v3/model/view/activity_detail_view_model.dart';

class ActivityViewModel {
  final String date;
  final String monthYear;
  final String day;

  final List<ActivityDetailModel> activityDetailList;

  const ActivityViewModel({
    required this.date,
    required this.monthYear,
    required this.day,
    required this.activityDetailList,
  });
}
