import 'package:easy_somity/app/modules/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../const/base_url.dart';
import '../../const/storage_healper.dart';
import '../../const/widgets/custom_snakebar.dart';
import '../../routes/app_pages.dart';
import 'user_model.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var user = UserModel(
    data: Data(
      id: 0,
      name: "",
      mobile: "",
      email: "",
      roleId: 0,
      languageCode: "",
      status: "",
      password: "",
      createdAt: "",
      updatedAt: "",
    ),
    accessToken: "",
    tokenType: "",
  ).obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;

  void validateEmail(String value) {
    isEmailValid.value = GetUtils.isEmail(value);
  }

  void validatePassword(String value) {
    isPasswordValid.value = value.length >= 6;
  }

  bool get isFormValid => isEmailValid.value && isPasswordValid.value;


  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    final AuthController _authController = Get.put(AuthController());

    try {
      final response = await http.post(
        Uri.parse('${BaseUrl.basedUrl}/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        user.value = UserModel.fromJson(jsonData);

        Get.toNamed(Routes.DASHBOARD);
        Fluttertoast.showToast(
          msg: "Login Successfull, ${_authController.user.value.data.name}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
      else {
        // Handle error cases here
        print('Login failed');
        customSnakebar(
            title: 'Enter Correct Email and Password',
            description: '',
            color: Colors.redAccent,
            icon: Icons.error);
      }
    } catch (e) {
      customSnakebar(
          title: 'Network Connection Error',
          description: 'Make sure your device internet connection is stable',
          color: Colors.redAccent,
          icon: Icons.error);
    } finally {
      isLoading.value = false;
    }
  }
}

