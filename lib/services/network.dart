import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:task_for_eclipse/config/urls.dart';

class Network {
  Future<dynamic> get(String method) async {
    var cache = await storage.read(key: method);
    var response;
    if (cache == null) {
      response = await http.get(Uri.parse(baseUrl + method));
      await storage.write(
          key: method,
          value: convert.jsonEncode(convert.jsonDecode(response.body)));
      var newMethod = await storage.read(key: method);
     // print('GET REQUEST ===> baseUrl: ${baseUrl + method}\nGET RESPONSE ===> ${response.body}');
      return convert.jsonDecode(newMethod!);
    } else {
      var oldMethod = await storage.read(key: method);
      return convert.jsonDecode(oldMethod!);
    }

  }

  Future<dynamic> post(
    String method,
    body,
  ) async {
    var response = await http.post(Uri.parse(baseUrl + method), body: body);
    // print("POST REQUEST ===> baseUrl: ${baseUrl + method}\nPOST REQUEST BODY ===> $body\nPOST RESPONSE ===> ${response.body}");
    switch (response.statusCode) {
      case 200:
      case 201:
        return convert.jsonDecode(response.body);
    }
  }
}
