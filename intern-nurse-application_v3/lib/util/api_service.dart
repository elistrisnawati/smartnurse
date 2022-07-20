import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intern_nurse_application_v3/data/api_constant.dart';
import 'package:intern_nurse_application_v3/model/rest/authentication_output.dart';
import 'package:intern_nurse_application_v3/model/rest/authorization_output.dart';
import 'package:intern_nurse_application_v3/model/rest/composite_output.dart';
import 'package:intern_nurse_application_v3/model/rest/document_output.dart';

class ApiService {
  static const String _userName = 'u01';
  static const String _password = 'zaq1@WSX';
  static const String _secret = '1fejZk40lkmJYO1DJI9lgBBtx9kfHjdo';
  static const String _clientId = 'pie';
  static const String _grantType = 'password';

  static const String _businessURL = 'https://app.pie.co.id';
  static const String _authURL =
      'https://sso.n-tco.com/auth/realms/YSH/protocol/openid-connect/token';

  String _token = '';
  String _sessionId = '';

  ApiService();

  Future<AuthenticationOutput> _authenticate() async {
    Map<String, String> body = {
      'redirect_uri': Uri.encodeFull(_authURL),
      'client_id': _clientId,
      'client_secret': _secret,
      'username': _userName,
      'password': _password,
      'grant_type': _grantType,
    };

    final response = await http.post(Uri.parse(_authURL), body: body);
    if (response.statusCode != 200) {
      throw Exception('Authentication Failed');
    }

    AuthenticationOutput authenticationResult =
        AuthenticationOutput.fromJson(json.decode(response.body));
    _token = authenticationResult.accessToken;

    return authenticationResult;
  }

  Future<AuthorizationOutput> _authorize() async {
    String body = jsonEncode({
      'clientId': 'SNE',
    });

    Map<String, String> header = _generateHeader();

    final response = await http.post(
        Uri.parse(_businessURL + ApiConstant.commandPageAuthenticate),
        headers: header,
        body: body);

    if (response.statusCode != 200) {
      throw Exception('Authorization Failed');
    }

    AuthorizationOutput authorizationResult =
        AuthorizationOutput.fromJson(json.decode(response.body));
    _sessionId = authorizationResult.session;

    return authorizationResult;
  }

  Future<DocumentOutput> update({
    required String secretKey,
    required String uniqueId,
    required Map<String, dynamic> updatedData,
  }) async {
    await _authenticate();
    await _authorize();

    DocumentOutput persistentDocument =
        await load(secretKey: secretKey, uniqueId: uniqueId);

    Map<String, dynamic> contentMap = persistentDocument.document.contentMap;
    contentMap.addAll(updatedData);

    String body = jsonEncode(
      {
        "secretKey": secretKey,
        "document": {
          "contentMap": contentMap,
        },
      },
    );

    final response = await http.post(
        Uri.parse(_businessURL + ApiConstant.commandDocumentUpdate),
        headers: _generateHeader(),
        body: body);

    if (response.statusCode != 200) {
      throw Exception('Failed to update');
    }

    return DocumentOutput.fromJson(json.decode(response.body));
  }

  Future<DocumentOutput> insert({
    required String secretKey,
    required String uniqueId,
    required Map<String, dynamic> document,
  }) async {
    await _authenticate();
    await _authorize();

    String body = jsonEncode(
      {
        "secretKey": secretKey,
        "document": {
          "contentMap": document,
        },
      },
    );

    final response = await http.post(
        Uri.parse(_businessURL + ApiConstant.commandDocumentInsert),
        headers: _generateHeader(),
        body: body);

    if (response.statusCode != 200) {
      throw Exception('Failed to insert');
    }

    return DocumentOutput.fromJson(json.decode(response.body));
  }

  Future<DocumentOutput> load({
    required String secretKey,
    required String uniqueId,
  }) async {
    await _authenticate();
    await _authorize();

    String body = jsonEncode({
      "secretKey": secretKey,
      "uniqueId": uniqueId,
    });

    final response = await http.post(
        Uri.parse(_businessURL + ApiConstant.commandDocumentLoad),
        headers: _generateHeader(),
        body: body);

    if (response.statusCode != 200) {
      throw Exception('Failed to load');
    }

    DocumentOutput documentOutput =
        DocumentOutput.fromJson(json.decode(response.body));

    return documentOutput;
  }

  Future<CompositeOutput> query({
    required String secretKey,
    required String uniqueId,
  }) async {
    await _authenticate();
    await _authorize();

    String body = jsonEncode({
      "secretKey": secretKey,
      "filterMap": {
        "UNIQUE_ID": uniqueId,
        "ACTIVE": true,
      },
    });

    final response = await http.post(
        Uri.parse(_businessURL + ApiConstant.commandCompositeQuery),
        headers: _generateHeader(),
        body: body);

    if (response.statusCode != 200) {
      throw Exception('Failed to query');
    }

    CompositeOutput compositeOutput =
        CompositeOutput.fromJson(json.decode(response.body));

    return compositeOutput;
  }

  Map<String, String> _generateHeader() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
      'x-session': _sessionId,
    };
  }
}
