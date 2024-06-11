import 'dart:convert';
import 'package:homepage/config.dart';
import 'package:homepage/models/login_request_model.dart';
import 'package:homepage/models/login_response_model.dart';
import 'package:homepage/models/regist_request_model.dart';
import 'package:homepage/models/edit_profile_request_model.dart';
import 'package:homepage/services/shared_service.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getUserProfile(String token) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.http(Config.apiURL, Config.getUserProfile);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  static Future<bool> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> editProfile(EditProfileRequestModel model, String token) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.http(Config.apiURL, Config.editProfileAPI);

    var response = await http.patch(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
