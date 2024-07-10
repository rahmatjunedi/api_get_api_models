import 'dart:convert';

import 'package:http/http.dart' as http;

// // https://jsonplaceholder.typicode.com/
// https://www.youtube.com/watch?v=zPnM41yURrA&list=PLOEXB48nQMqN4M8T64XdVsm71NfvjFq2O&index=3
class ApiService {
  Future<dynamic> getRequestWithoutModel() async {
    try {
      Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
