// To parse this JSON data, do
//
//     final compositeResult = compositeResultFromJson(jsonString);

import 'dart:convert';

CompositeOutput compositeResultFromJson(String str) =>
    CompositeOutput.fromJson(json.decode(str));

String compositeResultToJson(CompositeOutput data) =>
    json.encode(data.toJson());

class CompositeOutput {
  CompositeOutput({
    required this.authenticationId,
    required this.clientId,
    required this.secretKey,
    required this.sessionKey,
    required this.filterMap,
    required this.resultList,
  });

  final dynamic authenticationId;
  final dynamic clientId;
  final dynamic secretKey;
  final dynamic sessionKey;
  final dynamic filterMap;
  final List<CompositeResultList> resultList;

  factory CompositeOutput.fromJson(Map<String, dynamic> json) =>
      CompositeOutput(
        authenticationId: json["authenticationId"],
        clientId: json["clientId"],
        secretKey: json["secretKey"],
        sessionKey: json["sessionKey"],
        filterMap: json["filterMap"],
        resultList: List<CompositeResultList>.from(
            json["resultList"].map((x) => CompositeResultList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "authenticationId": authenticationId,
        "clientId": clientId,
        "secretKey": secretKey,
        "sessionKey": sessionKey,
        "filterMap": filterMap,
        "resultList": List<dynamic>.from(resultList.map((x) => x.toJson())),
      };
}

class CompositeResultList {
  CompositeResultList({
    required this.id,
    required this.uniqueId,
    required this.contentMap,
  });

  final dynamic id;
  final dynamic uniqueId;
  final Map<String, dynamic> contentMap;

  factory CompositeResultList.fromJson(Map<String, dynamic> json) =>
      CompositeResultList(
        id: json["id"],
        uniqueId: json["uniqueId"],
        contentMap: json["contentMap"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uniqueId": uniqueId,
        "contentMap": contentMap,
      };
}
