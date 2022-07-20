class PatientLabModel {
  final String orderId;
  final String orderDate;
  final String orderTime;
  final String patientId;
  final String labItem;
  final String labDescription;
  final String resultValue;
  final String normalValue;
  final String resultStatus;

  PatientLabModel({
    required this.orderId,
    required this.orderDate,
    required this.orderTime,
    required this.patientId,
    required this.labItem,
    required this.labDescription,
    required this.resultValue,
    required this.normalValue,
    required this.resultStatus,
  });
}
