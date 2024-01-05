import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/gb_widgets/showloding_dialog.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/resources/color_manager.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/resources/string_manager.dart';

import '../../data/local/storage_healper.dart';
import '../../data/remote/login_api.dart';
import '../screens/gb_widgets/custom_snakebar.dart';
import '../screens/resources/routes_manager.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKeyMobile = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool obscureText = true.obs;

//Email Validation
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return AppStrings.provideEmail;
    }
    return null;
  }

//Password Validation
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppStrings.provideNumber;
    }
    if (value.length < 5) {
      return AppStrings.provideNumber;
    }
    return null;
  }

  //Phone Validation
  String? validatePhone(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return AppStrings.providePhone;
    }
    if (value.length != 11) {
      return AppStrings.providePhone;
    }
    return null;
  }

//Form Validation Check
  getValidate() {
    var valid = formKey.currentState!.validate();
    if (kDebugMode) {
      print(valid);
    }

    if (!valid) {
      if (kDebugMode) {
        print('emapt');
      }
      return;
    } else {
      if (kDebugMode) {
        print('Not emapt');
      }
      var emailV = email.text;
      var passwordV = password.text;
      getLogin(emailV: emailV, passwordV: passwordV);
    }
  }

  //Get Login Attempt
  getLogin({required String emailV, required String passwordV}) async {
    showLoaderDialog(Get.context, 'Please Wait...');
    try {
      LoginApi.getlogin(email: emailV, password: passwordV).then((value) {
        Get.back();
        //Save To Db
        final response = json.decode(value);
        StorageHelper.setString(
            key: 'token', value: response['token']['token']);
        StorageHelper.setInt(key: 'role', value: response['user']['role']);
        if (kDebugMode) {
          print(response['user']);
        }
        // Get.offAllNamed(Routes.inActiveRoute);

        //Navigate to Home Page
        if (response['user']['role'] == 12 || response['user']['role'] == 14) {
          Get.offAllNamed(Routes.homeRoute);
        } else {
          Get.offAllNamed(Routes.inActiveRoute);
        }
      }).onError((error, stackTrace) {
        Get.back();
        customSnakebar(
            title: AppStrings.formTitle,
            description: error.toString(),
            color: Colormanager.error,
            icon: Icons.info,
            snackPosition: SnackPosition.TOP);
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      Get.back();
      customSnakebar(
          title: AppStrings.formTitle,
          description: error.toString(),
          color: Colormanager.error,
          icon: Icons.info,
          snackPosition: SnackPosition.TOP);
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    FocusScope.of(Get.context!).requestFocus();
    super.onClose();
  }
}
