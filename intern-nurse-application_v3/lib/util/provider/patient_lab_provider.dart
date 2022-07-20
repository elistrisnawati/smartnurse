import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v3/data/result_state.dart';
import 'package:intern_nurse_application_v3/model/rest/composite_output.dart';
import 'package:intern_nurse_application_v3/util/api_service.dart';

class PatientLabProvider extends ChangeNotifier {
  final ApiService apiService;

  final String secretKey;
  final String uniqueId;

  PatientLabProvider({
    required this.apiService,
    required this.secretKey,
    required this.uniqueId,
  }) {
    _fetchData();
  }

  String _message = '';

  String get message => _message;

  late List<CompositeResultList> _restOutput;

  List<CompositeResultList> get result => _restOutput;

  late ResultState _state;

  ResultState get state => _state;

  Future<dynamic> _fetchData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      CompositeOutput compositeOutput = await apiService.query(
        secretKey: secretKey,
        uniqueId: uniqueId,
      );
      _restOutput = compositeOutput.resultList;

      _state = ResultState.hasData;
      notifyListeners();
      return _restOutput;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
