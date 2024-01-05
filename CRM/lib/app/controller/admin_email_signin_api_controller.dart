import 'package:crm/app/const/widgets/custom_snakebar.dart';
import 'package:crm/app/modules/dashboard/view/dashboard_view.dart';
import 'package:crm/app/modules/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crm/app/modules/signin/view/admin_email_signin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_pages.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool isLoggedIn = false.obs;
  RxString message = ''.obs;
  RxString accessToken = ''.obs;
  RxString tokenType = ''.obs;

  // Check if the user is logged in during app startup
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
    message.value = prefs.getString('message') ?? '';
    accessToken.value = prefs.getString('accessToken') ?? '';
    tokenType.value = prefs.getString('tokenType') ?? '';
    email.value = prefs.getString('email') ?? '';
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('https://crm.creativesoftware.com.bd/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email.value,
          'password': password.value,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final loginData = adminLogin.fromJson(data);

        // Store user data in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        prefs.setString('message', loginData.message ?? '');
        prefs.setString('accessToken', loginData.accessToken ?? '');
        prefs.setString('tokenType', loginData.tokenType ?? '');
        prefs.setString('email', loginData.email ?? '');

        Get.to(DashboardView());

        isLoggedIn.value = true;
        message.value = loginData.message ?? '';
        accessToken.value = loginData.accessToken ?? '';
        tokenType.value = loginData.tokenType ?? '';
        email.value = loginData.email ?? '';

        customSnakebar(
            title: loginData.message ?? '',
            description: '',
            color: Colors.green,
            snackPosition: SnackPosition.BOTTOM,
            icon: Icons.check
        );

        print('Login successful');
        print('Message: ${loginData.message}');
        print('Access token: ${loginData.accessToken}');
      } else {
        isLoggedIn.value = false;
        message.value = 'Login failed';
        print('Login failed with status: ${response.statusCode}');
        customSnakebar(
            title: 'Login failed',
            description: 'Enter Correct Email and Password',
            color: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
            icon: Icons.error_outline
        );
      }
    } catch (e) {
      isLoggedIn.value = false;
      message.value = 'An error occurred';
      print('Login failed with error: $e');
    }finally {
      isLoading.value = false; // Set loading to false when the request is complete
    }
  }

  void logout() {
    // Clear user data and logout
    isLoggedIn.value = false;
    message.value = '';
    accessToken.value = '';
    tokenType.value = '';

    Get.to(SliderScreenView());

    customSnakebar(
        title: 'Logout',
        description: '',
        color: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        icon: Icons.logout
    );

    // Clear the session
    // Example using shared_preferences:
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isLoggedIn', false);
      prefs.remove('accessToken');
    });
  }
}
