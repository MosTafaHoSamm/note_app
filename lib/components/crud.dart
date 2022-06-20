import 'dart:convert';

import 'package:http/http.dart' as http;

class Crud {
  static getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('Get Data successfully');
        var responseData = jsonDecode(response.body);
        return responseData;
      } else {
        print('Error${response.statusCode}');
      }
    } catch (e) {
      print('$e');
    }
  }

  static postRequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        print('Post Data Successfully');
        var responseData = jsonDecode(response.body);
        return responseData;
      } else {
        print('Error : ${response.statusCode}');
      }
    } catch (e) {
      print('Error $e');
    }
  }
}
