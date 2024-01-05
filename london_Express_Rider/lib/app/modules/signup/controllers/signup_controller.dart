import 'dart:convert';
import 'dart:io';

import 'package:amvines_rider_new/app/modules/signup/model/resgistredmodel.dart';
import 'package:amvines_rider_new/app/modules/signup/providers/signup_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/app_constant.dart';
import '../../../gb_widgets/custom_progress_dialog.dart';
import '../../../gb_widgets/custom_snakebar.dart';
import '../model/DistrictResponse.dart';
import '../model/area_response.dart';

class SignupController extends GetxController {
  SignupProvider provider;
  SignupController({required this.provider});
  Branch? selectValue;
  AreaResponse? selectAreaValue;
  Rx<File> profile = File('10').obs;
  Rx<File> nidSelf = File('10').obs;
  Rx<File> nidFather = File('10').obs;
  final picker = ImagePicker();

  var distList = <Branch>[].obs;

  //RxList<AreaResponse> dataAreaList = RxList<AreaResponse>[]().obs;
  var dataAreaList = <AreaResponse>[].obs;
  final formKey = GlobalKey<FormState>();
  Rx<bool> obsText = true.obs;
  Rx<bool> obsText1 = true.obs;

  final Rx<TextEditingController> emailConttroller =
      TextEditingController().obs;
  final Rx<TextEditingController> nameConttroller = TextEditingController().obs;
  final Rx<TextEditingController> phoneConttroller =
      TextEditingController().obs;
  final Rx<TextEditingController> passConttroller = TextEditingController().obs;
  final Rx<TextEditingController> conpassCConttroller =
      TextEditingController().obs;
  final Rx<TextEditingController> presentAddressConttroller =
      TextEditingController().obs;
  final Rx<TextEditingController> permanentAddressConttroller =
      TextEditingController().obs;

  final Rx<TextEditingController> fatharsNameConttroller =
      TextEditingController().obs;
  final Rx<TextEditingController> fathersPhoneConttroller =
      TextEditingController().obs;
  final Rx<TextEditingController> selfNidNoConttroller =
      TextEditingController().obs;
  final Rx<TextEditingController> fathersNidNoConttroller =
      TextEditingController().obs;

  bool remember = false;
  final List<String?> errors = [];
  @override
  void onInit() {
    getDisstrictList();
    super.onInit();
  }

  @override
  void onClose() {}

  getDisstrictList() async {
    provider.getDisstrictList().then((value) {
      final body = json.decode(value.body);
      if (value.statusCode == 200) {
        distList.value = BranchResponse.fromJson(body).data!;
        if (distList.isNotEmpty) {
          selectValue = distList[0];
          getDisstrictWiseAreList(subArea: selectValue!.name);
        }
      } else {}
    }).onError((error, stackTrace) {});
  }

  getDisstrictWiseAreList({required String? subArea}) async {
    provider.getDisstrictWiseAreList(subArea.toString()).then((value) {
      List body = json.decode(value.body) as List;
      if (value.statusCode == 200) {
        dataAreaList.value = body.map((d) => AreaResponse.fromJson(d)).toList();
        if (dataAreaList.isNotEmpty) {
          selectAreaValue = dataAreaList[0];
        }
      } else {}
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  Future getImage(int value) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (value == 1) {
        profile.value = File(pickedFile.path);
      } else if (value == 2) {
        nidSelf.value = File(pickedFile.path);
      } else if (value == 3) {
        nidFather.value = File(pickedFile.path);
      }
    } else {}
  }

  getCheckValidation() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else if (profile.value.path == '10') {
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Profile Image Needed',
          color: const Color.fromARGB(255, 249, 17, 0));
    } else if (selectValue == null) {
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Select Branch ',
          color: const Color.fromARGB(255, 249, 17, 0));
    }
    // else if (selectAreaValue == null) {
    //   customSnakebar(
    //       icon: Icons.error,
    //       title: 'Error Message !',
    //       description: 'Select Sub-Area ',
    //       color: const Color.fromARGB(255, 249, 17, 0));
    // }
    else if (nidSelf.value.path == '10') {
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Your NID Needed',
          color: const Color.fromARGB(255, 249, 17, 0));
    } else if (nidFather.value.path == '10') {
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Your Fathes NID Needed',
          color: const Color.fromARGB(255, 249, 17, 0));
    } else {
      getSignUp();
    }
  }

  getSignUp() async {
    showLoaderDialog(Get.context);
    RegistredModel registredModel = RegistredModel(
        name: nameConttroller.value.text,
        mobile: phoneConttroller.value.text,
        email: emailConttroller.value.text,
        password: passConttroller.value.text,
        presentAddress: presentAddressConttroller.value.text,
        permanentAddress: permanentAddressConttroller.value.text,
        fathersName: fatharsNameConttroller.value.text,
        fathersPhoneNo: fathersPhoneConttroller.value.text,
        voterIdNo: selfNidNoConttroller.value.text,
        fatherVoterIdNo: fathersNidNoConttroller.value.text,
        district: '',
        area: selectValue!.name.toString(),
        zoneId: selectValue!.id.toString(),
        profilePhoto: profile.value,
        userVoterIdPhoto: nidSelf.value,
        fathersVoterIdPhoto: nidFather.value);

    provider.riderRegister(registredModel).then((value) {
      if (value.statusCode == 200) {
        Get.back();
        Get.back();
        customSnakebar(
            icon: Icons.check,
            title: 'Success Message !',
            description: 'Successfully Registration',
            snackPosition: SnackPosition.TOP,
            color: AppColorsConst.dPrimaryColor);
      } else if (value.statusCode == 406) {
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'This Email Already Exists..',
            color: const Color.fromARGB(255, 249, 17, 0));
      } else {
        if (kDebugMode) {
          print(value);
        }
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Some Fields Are Missing Please Try Again !',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      Get.back();
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }
}
