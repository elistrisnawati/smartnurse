// To parse this JSON data, do
//
//     final authorizationResult = authorizationResultFromJson(jsonString);

import 'dart:convert';

AuthorizationOutput authorizationResultFromJson(String str) =>
    AuthorizationOutput.fromJson(json.decode(str));

String authorizationResultToJson(AuthorizationOutput data) =>
    json.encode(data.toJson());

class AuthorizationOutput {
  AuthorizationOutput({
    required this.authenticationId,
    required this.clientId,
    required this.userId,
    required this.password,
    required this.clientUrlId,
    required this.pageId,
    required this.uniqueId,
    required this.oauth2Client,
    required this.oauth2ClientSecret,
    required this.session,
    required this.authorizedDocumentGroupList,
    required this.authorizedDocumentMap,
    required this.authorizedPageMap,
    required this.clientUrl,
    required this.firebaseConfig,
    required this.page,
    required this.token,
  });

  final dynamic authenticationId;
  final dynamic clientId;
  final dynamic userId;
  final dynamic password;
  final dynamic clientUrlId;
  final dynamic pageId;
  final dynamic uniqueId;
  final dynamic oauth2Client;
  final dynamic oauth2ClientSecret;
  final String session;
  final List<AuthorizedDocumentGroupList> authorizedDocumentGroupList;
  final Map<String, List<AuthorizedMap>> authorizedDocumentMap;
  final Map<String, List<AuthorizedMap>> authorizedPageMap;
  final dynamic clientUrl;
  final dynamic firebaseConfig;
  final dynamic page;
  final dynamic token;

  factory AuthorizationOutput.fromJson(Map<String, dynamic> json) =>
      AuthorizationOutput(
        authenticationId: json["authenticationId"],
        clientId: json["clientId"],
        userId: json["userId"],
        password: json["password"],
        clientUrlId: json["clientUrlId"],
        pageId: json["pageId"],
        uniqueId: json["uniqueId"],
        oauth2Client: json["oauth2Client"],
        oauth2ClientSecret: json["oauth2ClientSecret"],
        session: json["session"],
        authorizedDocumentGroupList: List<AuthorizedDocumentGroupList>.from(
            json["authorizedDocumentGroupList"]
                .map((x) => AuthorizedDocumentGroupList.fromJson(x))),
        authorizedDocumentMap: Map.from(json["authorizedDocumentMap"]).map(
            (k, v) => MapEntry<String, List<AuthorizedMap>>(
                k,
                List<AuthorizedMap>.from(
                    v.map((x) => AuthorizedMap.fromJson(x))))),
        authorizedPageMap: Map.from(json["authorizedPageMap"]).map((k, v) =>
            MapEntry<String, List<AuthorizedMap>>(
                k,
                List<AuthorizedMap>.from(
                    v.map((x) => AuthorizedMap.fromJson(x))))),
        clientUrl: json["clientUrl"],
        firebaseConfig: json["firebaseConfig"],
        page: json["page"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "authenticationId": authenticationId,
        "clientId": clientId,
        "userId": userId,
        "password": password,
        "clientUrlId": clientUrlId,
        "pageId": pageId,
        "uniqueId": uniqueId,
        "oauth2Client": oauth2Client,
        "oauth2ClientSecret": oauth2ClientSecret,
        "session": session,
        "authorizedDocumentGroupList": List<dynamic>.from(
            authorizedDocumentGroupList.map((x) => x.toJson())),
        "authorizedDocumentMap": Map.from(authorizedDocumentMap).map((k, v) =>
            MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "authorizedPageMap": Map.from(authorizedPageMap).map((k, v) =>
            MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "clientUrl": clientUrl,
        "firebaseConfig": firebaseConfig,
        "page": page,
        "token": token,
      };
}

class AuthorizedDocumentGroupList {
  AuthorizedDocumentGroupList({
    required this.active,
    required this.name,
    required this.remark,
    required this.uniqueId,
    required this.client,
    required this.order,
    required this.section,
  });

  final bool active;
  final String name;
  final dynamic remark;
  final String uniqueId;
  final Client client;
  final int order;
  final Client section;

  factory AuthorizedDocumentGroupList.fromJson(Map<String, dynamic> json) =>
      AuthorizedDocumentGroupList(
        active: json["ACTIVE"],
        name: json["NAME"],
        remark: json["REMARK"],
        uniqueId: json["UNIQUE_ID"],
        client: Client.fromJson(json["client"]),
        order: json["order"],
        section: Client.fromJson(json["section"]),
      );

  Map<String, dynamic> toJson() => {
        "ACTIVE": active,
        "NAME": name,
        "REMARK": remark,
        "UNIQUE_ID": uniqueId,
        "client": client.toJson(),
        "order": order,
        "section": section.toJson(),
      };
}

class Client {
  Client({
    required this.foreignId,
    required this.value,
  });

  final String foreignId;
  final String value;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        foreignId: json["FOREIGN_ID"],
        value: json["VALUE"],
      );

  Map<String, dynamic> toJson() => {
        "FOREIGN_ID": foreignId,
        "VALUE": value,
      };
}

class AuthorizedMap {
  AuthorizedMap({
    required this.uniqueLineId,
    required this.document,
    required this.documentName,
    required this.secretKey,
  });

  final String uniqueLineId;
  final String document;
  final String documentName;
  final String secretKey;

  factory AuthorizedMap.fromJson(Map<String, dynamic> json) => AuthorizedMap(
        uniqueLineId: json["UNIQUE_LINE_ID"],
        document: json["document"],
        documentName: json["documentName"],
        secretKey: json["secretKey"],
      );

  Map<String, dynamic> toJson() => {
        "UNIQUE_LINE_ID": uniqueLineId,
        "document": document,
        "documentName": documentName,
        "secretKey": secretKey,
      };
}
