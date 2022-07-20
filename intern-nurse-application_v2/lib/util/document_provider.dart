import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v2/data/result_state.dart';
import 'package:intern_nurse_application_v2/model/rest/document_output.dart';
import 'package:intern_nurse_application_v2/util/api_service.dart';

class DocumentProvider extends ChangeNotifier {
  final ApiService apiService;

  final String secretKey;
  final String uniqueId;

  DocumentProvider({
    required this.apiService,
    required this.secretKey,
    required this.uniqueId,
  }) {
    _fetchData();
  }

  String _message = '';
  String get message => _message;

  late Map<String, dynamic> _restOutput;
  Map<String, dynamic> get result => _restOutput;

  late ResultState _state;
  ResultState get state => _state;

  Future<dynamic> _fetchData() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      DocumentOutput documentOutput = await apiService.load(
        secretKey:secretKey,
        uniqueId :uniqueId,
      );
      _restOutput = documentOutput.document.contentMap;

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
