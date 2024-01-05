import 'dart:convert';
import 'dart:io';

import 'package:amvines_rider_new/app/modules/profile/model/riderprofileinfo.dart';
import 'package:amvines_rider_new/app/modules/profile/providers/profile_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController
    with StateMixin<RiderProfileInfo> {
  ProfileProvider provider;
  ProfileController({required this.provider});
  RxString gender = 'MALE'.obs;

  final addFormKey = GlobalKey<FormState>();
  File? image;
  final picker = ImagePicker();

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> fatherNameController = TextEditingController().obs;
  Rx<TextEditingController> fatherPhoneController = TextEditingController().obs;
  Rx<TextEditingController> ridingareaController = TextEditingController().obs;
  Rx<TextEditingController> presentAddressController =
      TextEditingController().obs;
  Rx<TextEditingController> permanentAddressController =
      TextEditingController().obs;

  Rx<bool> press = false.obs;

  bool updateStatus = false;
  bool readOnly = true;
  @override
  void onInit() {
    getUserInfo(true);
    super.onInit();
  }

  /*
  Get User Profile Information
  */
  getUserInfo(bool isLoad) async {
    if (isLoad) {
      change(null, status: RxStatus.loading());
    }

    await provider.getUserInfo().then((value) {
      try {
        var body = json.decode(value.body);

        if (value.statusCode == 200) {
          RiderProfileInfo riderinfo = RiderProfileInfo.fromJson(body);

          nameController.value.text = riderinfo.user!.name.toString();
          emailController.value.text = riderinfo.user!.email.toString();
          phoneController.value.text = riderinfo.user!.mobile.toString();
          fatherNameController.value.text =
              riderinfo.rider!.fathersName.toString();
          fatherPhoneController.value.text =
              riderinfo.rider!.fathersPhoneNo.toString();
          ridingareaController.value.text = riderinfo.rider!.area.toString();
          presentAddressController.value.text =
              riderinfo.rider!.presentAddress.toString();
          permanentAddressController.value.text =
              riderinfo.rider!.permanentAddress.toString();

          change(riderinfo, status: RxStatus.success());
        }
      } catch (exp) {
        if (kDebugMode) {
          print(exp);
        }
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
