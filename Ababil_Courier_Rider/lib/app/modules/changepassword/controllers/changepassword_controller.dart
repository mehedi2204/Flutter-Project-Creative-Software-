import 'dart:convert';

import 'package:amvines_rider_new/app/const/storage_healper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:amvines_rider_new/app/modules/changepassword/providers/changepassword_provider.dart';

import '../../../gb_widgets/custom_progress_dialog.dart';
import '../../../gb_widgets/custom_snakebar.dart';
import '../../../routes/app_pages.dart';

class ChangepasswordController extends GetxController {
  ChangepasswordProvider provider;
  ChangepasswordController({
    required this.provider,
  });
  final GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmpasswordController =
      TextEditingController().obs;
  Rx<bool> isVisible = true.obs;
  Rx<bool> isVisible2 = true.obs;
  String? newPassword;
  String? oldpPassword;

  @override
  void onClose() {}

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
    final isValid = fromkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    fromkey.currentState!.save();
    showLoaderDialog(Get.context);

    await provider
        .getChangePassword(
            newPassword: newPassword.toString(),
            oldpPassword: oldpPassword.toString())
        .then((value) {
      var body = json.decode(value);
      Get.back();
      
      if (body['status'] == true) {
        customSnakebar(
            icon: Icons.check,
            title: 'Success Message !',
            description: body['message'],
            snackPosition: SnackPosition.TOP,
            color: const Color.fromARGB(255, 8, 58, 17));
        StorageHelper.eraseAll();
        Get.offAllNamed(Routes.LOGIN);
      } else {
        customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: body['message'],
          color: const Color.fromARGB(255, 249, 17, 0));
      }
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
