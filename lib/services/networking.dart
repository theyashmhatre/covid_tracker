import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    print('network helper was called');
    print(url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      print('Response code : $response.statusCode');

      return decodedData;
    } else {
      print('response code : ${response.statusCode}');
      return CircularProgressIndicator();
    }
  }
}
