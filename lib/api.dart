import 'dart:convert';

import 'package:assignment_app/models.dart';
import 'package:http/http.dart' as http;

Future<ApiResult> fetchApi(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // print(json.decode(response.body));
    return apiResultFromJson(response.body);
  } else {
    print("error");
    throw Exception('Failed to fetch data.');
  }
}
