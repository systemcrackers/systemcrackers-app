import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uia_app/models/login_request_model.dart';
import 'package:uia_app/models/register_request_model.dart';
import 'package:uia_app/models/register_response_model.dart';
import 'package:uia_app/utils/config.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.loginApi);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      // login successful
      // SHARED service

      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.registerApi);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }
}
