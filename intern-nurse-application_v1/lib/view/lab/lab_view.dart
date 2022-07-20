import "package:flutter/material.dart";
import 'package:interns_nurse_application/data/constant_data.dart';
import 'package:interns_nurse_application/model/patient_lab_model.dart';
import 'package:interns_nurse_application/view/util/generic_text.dart';

// to make the standar bottom navigation
class PatientLabView extends StatelessWidget {
  final PatientLabModel patientLab;

  const PatientLabView({required this.patientLab, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenericText(text: patientLab.orderId),
              GenericText(text: patientLab.orderDate + " " + patientLab.orderTime),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GenericText(text: patientLab.labItem),
              GenericText(text: patientLab.labDescription),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GenericText(text: patientLab.normalValue),
              GenericText(text: patientLab.resultValue),
              Icon(
                patientLab.resultStatus == "NORMAL"
                    ? Icons.check_circle
                    : Icons.warning,
                color: patientLab.resultStatus == "NORMAL"
                    ? Colors.green
                    : Colors.orange,
                size: ConstantData.iconSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
