import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/class/DataAccessObject.dart';

const baseUrl = "https://b17bbafcbd65.ngrok.io";

Future<List<AllListData>> fetchData() async {
  var url = baseUrl + '/webhook';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed
        .map<AllListData>((item) => AllListData.fromJson(item))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<bool> sendingData(dynamic data) async {
  // var url = baseUrl + '/editdb';
  var url = baseUrl + '/post_test';
  final http.Response response = await http.post(
    url,
    body: jsonEncode(data.toJson()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 201) {
    print('Suscess !');
    return true;
  } else {
    throw Exception('Failed to load...');
  }
}
