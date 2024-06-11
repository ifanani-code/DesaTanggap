import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:homepage/config.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/login_response_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    return isKeyExist;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("login_details");

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_details");

      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(
    LoginResponseModel model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "login_details", syncData: jsonEncode(model.toJson()));

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  static Future<String> getUserProfile(String token) async {
    var requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var url = Uri.http(Config.apiURL, Config.getUserProfile);

    var response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  Future<Map<String, dynamic>> fetchUserData(String token) async {
  var url = Uri.http(Config.apiURL, Config.getUserProfile); // Ganti URL dengan URL API Anda
  var headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  };

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    // Jika permintaan berhasil
    return json.decode(response.body); // Parsing JSON response
  } else {
    // Jika permintaan gagal
    throw Exception('Failed to load user data');
  }
}
}
