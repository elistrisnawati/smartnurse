class ActivityModel {
  final String userId;
  final String date;
  final String monthYear;
  final String day;
  final String time;
  final String location;
  final String description;

  const ActivityModel({
    required this.userId,
    required this.date,
    required this.monthYear,
    required this.day,
    required this.time,
    required this.location,
    required this.description,
  });
}
