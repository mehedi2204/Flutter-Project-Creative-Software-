
import 'dart:convert';

import 'package:dokan_pos/app/View/Login/response/login_response.dart';
import 'package:dokan_pos/app/constraints/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constraints/custom_progress_dialog.dart';
import '../../../constraints/custom_snakebar.dart';
import '../../../constraints/storage_healper.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {

  LoginResponse loginResponse;
  LoginController({required this.loginResponse});

  final GlobalKey<FormState> loginFromKey = GlobalKey<FormState>();
  late TextEditingController mobileController, passwordController;
  var mobile = '';
  var password = '';
  RxBool isRemember = true.obs;
  RxBool isVisible = true.obs;

  @override
  void onInit() {
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();
  }

  String? validateMobile(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Provide Valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }


  checklLogin() async {
    final isValid = loginFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFromKey.currentState!.save();
    showLoaderDialog(Get.context);

    await loginResponse.getLogin(mobile: mobile, password: password)
        .then((value) {
      var body = json.decode(value);
      print(body);
      if (body["error"] == "Unauthorised") {
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Wrong Phone number or Password!',
            description: 'Provide valid Phone number and Password',
            color: const Color.fromARGB(255, 249, 17, 0));

      } else {
        Get.back();
        store(body);
        customSnakebar(
          icon: Icons.check,
          title: 'Success Message !',
          description: 'Successfully Login',
          snackPosition: SnackPosition.TOP,
          color: CustomColor.darkPrimary,
        );
        Get.offAllNamed(Routes.HOME);
      }
    }).onError((error, stackTrace) {
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong please try again !',
          color: const Color.fromARGB(255, 249, 17, 0));
      Get.back();
    });
  }

  store(var data) async {
    StorageHelper.setString(
        key: "token", value: data["success"]["token"]);

    // StorageHelper.setString(key: "id", value: data['user']['id'].toString());
    // StorageHelper.setString(
    //     key: "name", value: data['user']['name'].toString());
    // StorageHelper.setString(
    //     key: "email", value: data['user']['email'].toString());
    // StorageHelper.setString(
    //     key: "mobile", value: data['user']['mobile'].toString());
    // StorageHelper.setString(
    //     key: "photo", value: data['user']['photo'].toString());
    // StorageHelper.setInt(
    //     key: "role", value: int.parse(data['user']['role'].toString()));
    if (isRemember.value) {
      StorageHelper.setBool(key: "islogged", value: true);
    } else {
      StorageHelper.setBool(key: "islogged", value: false);
    }
  }
}