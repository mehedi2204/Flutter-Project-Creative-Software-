import 'dart:convert';

import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/storage_healper.dart';
import 'package:amvines_rider_new/app/gb_widgets/custom_progress_dialog.dart';
import 'package:amvines_rider_new/app/gb_widgets/custom_snakebar.dart';
import 'package:amvines_rider_new/app/modules/login/providers/login_provider.dart';
import 'package:amvines_rider_new/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginProvider loginProvider;
  LoginController({required this.loginProvider});
  final GlobalKey<FormState> loginFromKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  final count = 0.obs;
  RxBool isRemember = true.obs;
  RxBool isVisible = true.obs;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
     emailController.dispose();
     passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide Valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 4) {
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

    await loginProvider
        .getlogin(email: email, password: password)
        .then((value) {
      var body = json.decode(value);
      if (body['success'] == true) {
        Get.back();
        store(body);
        customSnakebar(
            icon: Icons.check,
            title: 'Success Message !',
            description: 'Successfully Login',
            snackPosition: SnackPosition.TOP,
            color: AppColorsConst.dPrimaryColor);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.back();

        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: body['message'],
            color: const Color.fromARGB(255, 249, 17, 0));
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
        key: "token", value: data['token']['token'].toString());

    StorageHelper.setString(key: "id", value: data['user']['id'].toString());
    StorageHelper.setString(
        key: "name", value: data['user']['name'].toString());
    StorageHelper.setString(
        key: "email", value: data['user']['email'].toString());
    StorageHelper.setString(
        key: "mobile", value: data['user']['mobile'].toString());
    StorageHelper.setString(
        key: "photo", value: data['user']['photo'].toString());
    StorageHelper.setInt(
        key: "role", value: int.parse(data['user']['role'].toString()));
    if (isRemember.value) {
      StorageHelper.setBool(key: "islogged", value: true);
    } else {
      StorageHelper.setBool(key: "islogged", value: false);
    }
  }
}
