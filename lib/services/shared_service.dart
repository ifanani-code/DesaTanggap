import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:homepage/config.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:homepage/models/login_response_model.dart';
import 'package:homepage/models/regist_request_model.dart';
import 'package:homepage/models/edit_profile_request_model.dart';

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

  static Future<bool> register(RegisterRequestModel model) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
      };

      var url = Uri.http(Config.apiURL, Config.registerAPI);

      var response = await http.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 200) {
        // Registrasi berhasil
        return true;
      } else {
        // Registrasi gagal
        return false;
      }
    } catch (e) {
      // Tangani kesalahan jaringan atau kesalahan lainnya
      print('Error: $e');
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
