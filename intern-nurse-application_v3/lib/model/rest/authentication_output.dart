// To parse this JSON data, do
//
//     final authenticationResult = authenticationResultFromJson(jsonString);

import 'dart:convert';

AuthenticationOutput authenticationResultFromJson(String str) =>
    AuthenticationOutput.fromJson(json.decode(str));

String authenticationResultToJson(AuthenticationOutput data) =>
    json.encode(data.toJson());

class AuthenticationOutput {
  AuthenticationOutput({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.refreshToken,
    required this.tokenType,
    required this.notBeforePolicy,
    required this.sessionState,
    required this.scope,
  });

  final String accessToken;
  final int expiresIn;
  final int refreshExpiresIn;
  final String refreshToken;
  final String tokenType;
  final int notBeforePolicy;
  final String sessionState;
  final String scope;

  factory AuthenticationOutput.fromJson(Map<String, dynamic> json) =>
      AuthenticationOutput(
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
        refreshExpiresIn: json["refresh_expires_in"],
        refreshToken: json["refresh_token"],
        tokenType: json["token_type"],
        notBeforePolicy: json["not-before-policy"],
        sessionState: json["session_state"],
        scope: json["scope"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "expires_in": expiresIn,
        "refresh_expires_in": refreshExpiresIn,
        "refresh_token": refreshToken,
        "token_type": tokenType,
        "not-before-policy": notBeforePolicy,
        "session_state": sessionState,
        "scope": scope,
      };
}
