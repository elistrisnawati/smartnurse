// To parse this JSON data, do
//
//     final documentOutput = documentOutputFromJson(jsonString);

import 'dart:convert';

DocumentOutput documentOutputFromJson(String str) =>
    DocumentOutput.fromJson(json.decode(str));

String documentOutputToJson(DocumentOutput data) => json.encode(data.toJson());

class DocumentOutput {
  DocumentOutput({
    required this.authenticationId,
    required this.clientId,
    required this.secretKey,
    required this.sessionKey,
    required this.uniqueId,
    required this.document,
  });

  final dynamic authenticationId;
  final dynamic clientId;
  final dynamic secretKey;
  final dynamic sessionKey;
  final dynamic uniqueId;
  final Document document;

  factory DocumentOutput.fromJson(Map<String, dynamic> json) => DocumentOutput(
        authenticationId: json["authenticationId"],
        clientId: json["clientId"],
        secretKey: json["secretKey"],
        sessionKey: json["sessionKey"],
        uniqueId: json["uniqueId"],
        document: Document.fromJson(json["document"]),
      );

  Map<String, dynamic> toJson() => {
        "authenticationId": authenticationId,
        "clientId": clientId,
        "secretKey": secretKey,
        "sessionKey": sessionKey,
        "uniqueId": uniqueId,
        "document": document.toJson(),
      };
}

class Document {
  Document({
    required this.id,
    required this.uniqueId,
    required this.contentMap,
  });

  final dynamic id;
  final dynamic uniqueId;
  final Map<String, dynamic> contentMap;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
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
