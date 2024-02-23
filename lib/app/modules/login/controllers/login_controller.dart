import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/api.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var email = ''.obs;
  var password = ''.obs;

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }


  Future<void> login() async {
    try {
      var response = await _performLogin();
      var responseBody = json.decode(response.body);

      if (response.statusCode == 200 && responseBody['accessToken'] != null) {
        _saveUserData(responseBody);
        Get.offAllNamed('/');
      } else {
        Get.snackbar(
            '𝙀𝙧𝙧𝙤𝙧 !', '𝙇𝙤𝙜𝙞𝙣 𝙛𝙖𝙞𝙡𝙚𝙙. ${responseBody['msg']}');
      }
    } catch (e) {
      print('Error during login: $e');
      Get.snackbar('Error', 'An error occurred during login.');
    }
  }

  Future<http.Response> _performLogin() async {
    var apiUrl = '/auth/login';
    var requestBody = {'email': email.value, 'password': password.value};

    return await http.post(
      Uri.parse(Api.baseUrl + apiUrl),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );
  }

  void _saveUserData(Map<String, dynamic> responseBody) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', responseBody['accessToken']);

    // Memasukkan informasi role ke dalam shared preferences
    localStorage.setString('role', responseBody['role']);
  }

  void goToRegister() {
    Get.toNamed('/register');
  }
}
