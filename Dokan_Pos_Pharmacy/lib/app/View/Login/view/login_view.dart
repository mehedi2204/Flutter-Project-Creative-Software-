import 'package:dokan_pos/app/View/Login/controller/login_controller.dart';
import 'package:dokan_pos/app/constraints/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constraints/button.dart';
import '../../../constraints/size_config.dart';
import '../../../routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CustomColor.backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(top: 200, left: 10, right: 10),
        height: SizeConfig.screenHight,
        width: SizeConfig.screenWidth,
        child: Form(
          key: controller.loginFromKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        //elevation: large ? 6 : (medium ? 4 : 2),
                        child: TextFormField(
                          controller: controller.mobileController,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(fontSize: 2.5 * 6),
                          cursorColor: Colors.greenAccent,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              labelText: 'Phone',
                              hintText: 'Enter valid Phone Number',
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.orange,
                                    width: 2,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Colors.greenAccent,
                                  )),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.red)),
                              errorStyle: TextStyle(
                                color: Colors.red,
                              )),
                          validator: (String? value) {
                            return controller.validateMobile(value!);
                          },
                          onSaved: (String? value) {
                            controller.mobile = value!;
                          },
                        ),
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
                          controller: controller.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isVisible.value,
                          obscuringCharacter: "*",
                          style: const TextStyle(fontSize: 2.5 * 6),
                          cursorColor: CustomColor.darkPrimary,
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
                              labelText: 'Password',
                              hintText: 'enter password',
                              labelStyle:
                              const TextStyle(color: Colors.grey),
                              border:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.orange,
                                    width: 2,
                                  )),
                              focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: CustomColor.darkPrimary,
                                  )),
                              focusedErrorBorder:
                              const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.red)),
                              errorStyle: const TextStyle(
                                color: Colors.red,
                              )),
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                          onSaved: (value) {
                            controller.password = value!;
                          },
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Obx(() => Checkbox(
                            value: controller.isRemember.value,
                            activeColor: CustomColor.lightPrimary,
                            onChanged: (value) {
                              controller.isRemember.value =
                              !controller.isRemember.value;
                            })),
                        Text("Remember me".tr),
                        const Spacer(),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.FORGOTPASSWORD),
                          child: Text(
                            "Forgot Password".tr,
                            style: const TextStyle(
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtton(
                      sizeWidth: MediaQuery.of(context).size.width*0.5,
                      sizeHeight: 50,
                      color: CustomColor.darkPrimary,
                      press: () {
                        controller.checklLogin();
                      },
                      title: 'LOGIN',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text("Don't have an account?".tr),
                    //     GestureDetector(
                    //       onTap: () {
                    //         //risad
                    //         Get.toNamed(Routes.SIGNUP);
                    //       },
                    //       child: Text(
                    //         "Sign Up".tr,
                    //         style: const TextStyle(
                    //             fontSize: 16,
                    //             color: AppColorsConst.dPrimaryColor),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
