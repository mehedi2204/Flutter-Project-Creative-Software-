import 'dart:convert';

import 'package:amvines_rider_new/app/modules/forgotpassword/providers/forgotpassword_provider.dart';
import 'package:amvines_rider_new/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/storage_healper.dart';
import '../../../gb_widgets/custom_progress_dialog.dart';
import '../../../gb_widgets/custom_snakebar.dart';

class ForgotpasswordController extends GetxController {
  ForgotpasswordProvider provider;
  ForgotpasswordController({required this.provider});
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final GlobalKey<FormState> fromKeyCheckOtp = GlobalKey<FormState>();
  final GlobalKey<FormState> fromKeyResetPassword = GlobalKey<FormState>();
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> code = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmpasswordController =
      TextEditingController().obs;
  Rx<bool> isVisible = true.obs;
  Rx<bool> isVisible2 = true.obs;
  String? password;
  String? conPassword;

  var mobile = '';
  dynamic body;

  @override
  void onClose() {
    mobileController.value.dispose();
  }

  String? validPhone(String number) {
    if (number.isEmpty) {
      return "Empty Field not Allowed ";
    } else if (number.length != 11) {
      return "Provide Valid Mobile";
    }
    return null;
  }

  String? validCode(String number) {
    if (number.isEmpty) {
      return "Empty Field not Allowed ";
    }
    if (number.toString() != body['otp'].toString()) {
      return "Invalid Otp Code ";
    }

    // if (code.value.text.toString() == body['otp'].toString()) {
    //   Get.offNamed(Routes.RESETPASSWORD);

    //   customSnakebar(
    //       icon: Icons.check,
    //       title: 'Success Message !',
    //       description: 'Successfully Send Otp',
    //       snackPosition: SnackPosition.TOP,
    //       color: const Color.fromARGB(255, 7, 126, 79));
    //   return null;
    // }
    return null;
  }

  getNextpage() {
    fromKeyCheckOtp.currentState!.save();

    if (code.value.text == body['otp'].toString()) {
      Get.offNamed(Routes.RESETPASSWORD);
    } else {
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Invalid Otp Code ',
          color: const Color.fromARGB(255, 249, 17, 0));
    }
  }

  getSendOtp({required String? mobile}) async {
    final isValid = fromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    fromKey.currentState!.save();
    showLoaderDialog(Get.context);

    await provider.getSendOtp(mobile: mobile).then((value) {
      body = json.decode(value);
      if (kDebugMode) {
        print(body);
      }
      if (body['status'] == true) {
        Get.back();

        customSnakebar(
            icon: Icons.check,
            title: 'Success Message !',
            description: 'Successfully Send Otp',
            snackPosition: SnackPosition.TOP,
            color: const Color.fromARGB(255, 7, 126, 79));
        Get.offNamed(Routes.CHECKOTP);
      } else {
        Get.back();

        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: body['message'],
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      Get.back();
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong please try again !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  String? validateCpnfirlPassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    } else if (value.toString() != passwordController.value.text) {
      return "Password not match";
    }
    return null;
  }

  void changePassword() async {
    final isValid = fromKeyResetPassword.currentState!.validate();
    if (!isValid) {
      return;
    }
    fromKeyResetPassword.currentState!.save();
    showLoaderDialog(Get.context);

    await provider
        .getChangePassword(password: password, id: body['user_id'].toString())
        .then((value) {
      var body = json.decode(value);
      print(body);

      Get.back();
      customSnakebar(
          icon: Icons.check,
          title: 'Success Message !',
          description: 'Successfully Change',
          snackPosition: SnackPosition.TOP,
          color: const Color.fromARGB(255, 8, 58, 17));

      StorageHelper.eraseAll();

      code.value.dispose();
      mobileController.value.dispose();
      mobile = '';
      passwordController.value.dispose();
      confirmpasswordController.value.dispose();

      Get.offAllNamed(Routes.LOGIN);
    }).onError((error, stackTrace) {
      //print(error);
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong please try again !',
          color: const Color.fromARGB(255, 249, 17, 0));
      Get.back();
    });
  }
}
