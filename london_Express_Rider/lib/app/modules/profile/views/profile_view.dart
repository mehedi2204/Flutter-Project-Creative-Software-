import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../const/app_constant.dart';
import '../../../gb_widgets/profile_pic.dart';
import '../../../gb_widgets/userprofiletextfield.dart';
import '../../internetchecker/controllers/internetchecker_controller.dart';
import '../../internetchecker/views/internetchecker_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsConst.dPrimaryColor,
        elevation: 0,
        title: Text("Rider Profile".tr.toString()),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => Get.find<InternetcheckerController>()
                            .connectionStatus
                            .value ==
                        1
                    ? controller.obx(
                        (riderinfo) => riderinfo == null
                            ? EmptyFailureNoInternetView(
                                image: 'assets/lottie/empty_lottie.json',
                                title: 'Not Found',
                                description: 'Data Not Found',
                                buttonText: "Retry",
                                onPressed: () {},
                              )
                            : Obx(
                                () => SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ProfilePic(
                                        press: () {
                                          // if (!controller.readOnly) {
                                          //  // getImage();
                                          // }
                                        },
                                        profileUrl: riderinfo.user!.photo,
                                        edit: controller.readOnly ? true : true,
                                        image: File('10'),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      UserProfileTextField(
                                        name: controller.nameController.value,
                                        readOnly: controller.readOnly,
                                        lebelText: 'NAME'.tr,
                                        icon: Icons.person,
                                        press: () {
                                          controller.press.value = true;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      UserProfileTextField(
                                        name: controller
                                            .fatherNameController.value,
                                        readOnly: controller.readOnly,
                                        lebelText: 'FATHER NAME'.tr,
                                        icon: Icons.person,
                                        press: () {
                                          controller.press.value = true;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      UserProfileTextField(
                                        name: controller.emailController.value,
                                        readOnly: controller.readOnly,
                                        lebelText: 'EMAIL'.tr,
                                        icon: Icons.email_outlined,
                                        press: () {
                                          controller.press.value = true;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      UserProfileTextField(
                                        name: controller.phoneController.value,
                                        readOnly: controller.readOnly,
                                        lebelText: 'PHONE NUMBER'.tr,
                                        icon: Icons.phone,
                                        press: () {
                                          controller.press.value = true;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      UserProfileTextField(
                                        name: controller
                                            .fatherPhoneController.value,
                                        readOnly: controller.readOnly,
                                        lebelText: 'FATHER PHONE NUMBER'.tr,
                                        icon: Icons.phone,
                                        press: () {
                                          controller.press.value = true;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      UserProfileTextField(
                                        name: controller
                                            .ridingareaController.value,
                                        readOnly: controller.readOnly,
                                        lebelText: 'RIDING AREA'.tr,
                                        icon: Icons.location_on,
                                        press: () {
                                          controller.press.value = true;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      UserProfileTextField(
                                        name: controller
                                            .presentAddressController.value,
                                        readOnly: controller.readOnly,
                                        lebelText: 'PRESENT ADDRESS'.tr,
                                        icon: Icons.home_work_rounded,
                                        press: () {
                                          controller.press.value = true;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      UserProfileTextField(
                                        name: controller
                                            .permanentAddressController.value,
                                        readOnly: controller.readOnly,
                                        lebelText: 'PERMANENT ADDRESS'.tr,
                                        icon: Icons.home_work_rounded,
                                        press: () {
                                          controller.press.value = true;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        onEmpty: EmptyFailureNoInternetView(
                          image: 'assets/lottie/empty_lottie.json',
                          title: 'Content unavailable',
                          description: 'Data Not Found',
                          buttonText: "Retry",
                          onPressed: () {},
                        ),
                        onLoading: Center(
                          child: Lottie.asset(
                            'assets/lottie/loading.json',
                            height: 250,
                            width: 250,
                          ),
                        ),
                        onError: (error) => SingleChildScrollView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              child: EmptyFailureNoInternetView(
                                image: 'assets/lottie/failure_lottie.json',
                                title: 'Error',
                                description: error.toString(),
                                buttonText: "Retry",
                                onPressed: () {},
                              ),
                            ))
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: EmptyFailureNoInternetView(
                          image: 'assets/lottie/no_internet_lottie.json',
                          title: 'Network Error',
                          description: 'Internet not found !!',
                          buttonText: "Retry",
                          onPressed: () {},
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
