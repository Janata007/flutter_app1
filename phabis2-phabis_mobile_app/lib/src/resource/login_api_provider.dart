import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ss/src/resource/data.dart';

import 'network_util.dart';

class LoginApiProvider {
  static final Options options =
  Options(contentType: ContentType.parse("application/json"));

 /* Future<String> fetchToken() async {
    var response = await http.post(
      Uri.parse(tokenUrl),
      headers: headers,
      body: body,
    );
    Map<String, dynamic> jsonData =
    jsonDecode(response.body) as Map<String, dynamic>;
    Future<String> token = new Future<String>.value(jsonData['access_token']);

    return token;
  }*/

  Future<bool> logout() async {
    return await NetworkUtil.internal()
        .get(logoutUrl)
        .then((Response response) {
      print("response: $response");
      return true; // response.statusCode == 200;
    });
  }

  Future<bool> login(String username, String password) async {

    Map<String, String> bodyy = {
      'grant_type': "password",
      'password': password,
      'username': username
    };

    var response = await http.post(
      Uri.parse(loginUrl),
      headers: headers,
      body: bodyy,
    );
    Map<String, dynamic> jsonData =
    jsonDecode(response.body) as Map<String, dynamic>;
    mainToken = jsonData['access_token'];
    print(mainToken);


    return true;

  }

}
