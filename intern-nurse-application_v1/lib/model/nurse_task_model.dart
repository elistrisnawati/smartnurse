class NurseTaskModel {
  final String orderId;
  final String orderDate;
  final String orderTime;
  final String patientId;
  final String roomId;
  final String bedId;
  final String nurseId;
  final String orderTypeId;
  final String orderName;
  final String status;

  NurseTaskModel({
    required this.orderId,
    required this.orderDate,
    required this.orderTime,
    required this.patientId,
    required this.roomId,
    required this.bedId,
    required this.nurseId,
    required this.orderTypeId,
    required this.orderName,
    required this.status,
  });
}
