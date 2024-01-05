import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/size_config.dart';
import 'package:amvines_rider_new/app/gb_widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
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
                Container(
                  height: SizeConfig.screenHight! / 4,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Image.asset("assets/png/rider.png"),
                ),
                // Container(
                //   alignment: Alignment.center,
                //   child: Text('Rider Panel',
                //       //'Merchant Panel',
                //       style: GoogleFonts.frederickaTheGreat(
                //           fontSize: 25,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.red)),
                // ),
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
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontSize: 2.5 * 6),
                            cursorColor: Colors.greenAccent,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email',
                                hintText: 'enter valid email',
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
                              return controller.validateEmail(value!);
                            },
                            onSaved: (String? value) {
                              controller.email = value!;
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
                                    labelText: 'Password',
                                    hintText: 'enter password',
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
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
                              activeColor: AppColorsConst.oPrimaryColor,
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
      ),
    );
  }
}
