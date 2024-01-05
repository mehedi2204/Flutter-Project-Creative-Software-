import 'package:amvines_rider_new/app/const/size_config.dart';
import 'package:amvines_rider_new/app/modules/forgotpassword/controllers/forgotpassword_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_constant.dart';
import '../../../gb_widgets/button.dart';

class ResetpasswordView extends GetView<ForgotpasswordController> {
  const ResetpasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsConst.dPrimaryColor,
        title: Text("Change password".tr.toString()),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Form(
          key: controller.fromKeyResetPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Lottie.asset('assets/lottie/password.json',height: 200),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    //elevation: large ? 6 : (medium ? 4 : 2),
                    child: Obx(() => TextFormField(
                          controller: controller.passwordController.value,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isVisible.value,
                          obscuringCharacter: "*",
                          style: const TextStyle(fontSize: 2.5 * 6),
                          cursorColor: AppColorsConst.dPrimaryColor,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.isVisible.value =
                                      !controller.isVisible.value;
                                },
                                child: Icon(
                                  controller.isVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xFF666666),
                                  //size: defaultIconSize,
                                ),
                              ),
                              labelText: 'New Password',
                              hintText: 'enter new password',
                              labelStyle: const TextStyle(color: Colors.grey),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: AppColorsConst.orrange,
                                width: 2,
                              )),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 3,
                                color: AppColorsConst.dPrimaryColor,
                              )),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.red)),
                              errorStyle: const TextStyle(
                                color: Colors.red,
                              )),
                          validator: (value) {
                            return controller.validateCpnfirlPassword(value!);
                          },
                          onSaved: (value) {
                            controller.password = value;
                          },
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    //elevation: large ? 6 : (medium ? 4 : 2),
                    child: Obx(() => TextFormField(
                          controller:
                              controller.confirmpasswordController.value,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isVisible2.value,
                          obscuringCharacter: "*",
                          style: const TextStyle(fontSize: 2.5 * 6),
                          cursorColor: AppColorsConst.dPrimaryColor,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.isVisible2.value =
                                      !controller.isVisible2.value;
                                },
                                child: Icon(
                                  controller.isVisible2.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xFF666666),
                                  //size: defaultIconSize,
                                ),
                              ),
                              labelText: 'Re-Type New Password',
                              hintText: 'enter re-type new password',
                              labelStyle: const TextStyle(color: Colors.grey),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: AppColorsConst.orrange,
                                width: 2,
                              )),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 3,
                                color: AppColorsConst.dPrimaryColor,
                              )),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.red)),
                              errorStyle: const TextStyle(
                                color: Colors.red,
                              )),
                          validator: (value) {
                            return controller.validateCpnfirlPassword(value!);
                          },
                          onSaved: (value) {
                            controller.conPassword = value!;
                          },
                        )),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtton(
                  press: () {
                    controller.changePassword();
                  },
                  title: 'Change',
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
