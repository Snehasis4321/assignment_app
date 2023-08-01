// To parse this JSON data, do
//
//     final apiResult = apiResultFromJson(jsonString);

import 'dart:convert';

ApiResult apiResultFromJson(String str) => ApiResult.fromJson(json.decode(str));

String apiResultToJson(ApiResult data) => json.encode(data.toJson());

class ApiResult {
  final int count;
  final List<Entry> entries;

  ApiResult({
    required this.count,
    required this.entries,
  });

  factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
        count: json["count"],
        entries:
            List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
      };
}

class Entry {
  final String api;
  final String description;
  final String auth;
  final bool https;
  final String cors;
  final String link;
  final String category;

  Entry({
    required this.api,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        api: json["API"],
        description: json["Description"],
        auth: json["Auth"],
        https: json["HTTPS"],
        cors: json["Cors"],
        link: json["Link"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "API": api,
        "Description": description,
        "Auth": auth,
        "HTTPS": https,
        "Cors": cors,
        "Link": link,
        "Category": category,
      };
}
