import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/login_controller.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/resources/assets_manager.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/resources/color_manager.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/resources/routes_manager.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/resources/string_manager.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/resources/style_manager.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/resources/values_manager.dart';

import '../resources/size_config.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController(), permanent: false);
    return Scaffold(
      backgroundColor: Colormanager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(ImageAssets.splashLogo), //App Logo
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: AppSize.s10,
                    ),
                    child: Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            AppStrings.email,
                            style: getBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s14),
                          ),
                          const SizedBox(
                            height: AppSize.s10,
                          ),
                          TextFormField(
                            //Email FormField
                            controller: controller.email,

                            textInputAction: TextInputAction.next,

                            style: getBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s14),
                            textAlign: TextAlign.start,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: AppStrings.hEmail,
                              suffixIcon: Icon(
                                Icons.email,
                                color: Colormanager.black54,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colormanager.red,
                                ),
                                borderRadius: BorderRadius.circular(
                                  AppPadding.p14,
                                ),
                              ),
                              fillColor: Colormanager.fillcolor,
                              filled: true,
                            ),
                            validator: (value) {
                              return controller.validateEmail(value!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: AppSize.s10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          AppStrings.password,
                          style: getBoldStyle(
                              color: Colormanager.darkGrey,
                              fontSize: FontSize.s14),
                        ),
                        const SizedBox(
                          height: AppPadding.p8,
                        ),
                        Obx(() => TextFormField(
                              obscureText: controller.obscureText.value,
                              controller: controller.password,
                              textInputAction: TextInputAction.done,
                              style: getBoldStyle(
                                  color: Colormanager.darkGrey,
                                  fontSize: FontSize.s14),
                              decoration: InputDecoration(
                                hintText: AppStrings.hPassword,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    controller.obscureText.value =
                                        !controller.obscureText.value;
                                  },
                                  child: controller.obscureText.value
                                      ? Icon(
                                          Icons.visibility,
                                          color: Colormanager.black54,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: Colormanager.black54,
                                        ),
                                ),
                                // icon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppPadding.p14,
                                  ),
                                ),
                                fillColor: Colormanager.fillcolor,
                                filled: true,
                              ),
                              validator: (value) {
                                return controller.validatePassword(value!);
                              },
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppPadding.p20,
              ),
              InkWell(
                onTap: () {
                  controller.getValidate();
                },
                child: Container(
                  width: MediaQuery.of(
                    context,
                  ).size.width,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p12,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppPadding.p4,
                      ),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(2, 4),
                          blurRadius: 5,
                          spreadRadius: 2),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colormanager.primary, Colormanager.darkPrimary],
                    ),
                  ),
                  child: Text(
                    AppStrings.login,
                    style: getBoldStyle(
                        color: Colormanager.white, fontSize: FontSize.s16),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p8,
                ),
                alignment: Alignment.centerRight,
                child: Text(
                  AppStrings.forgetLink,
                  style: getRegularStyle(
                      color: Colormanager.darkGrey, fontSize: FontSize.s16),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: AppPadding.p12,
                ),
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: AppSize.s16,
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p4,
                        ),
                        child: Divider(
                          thickness: AppSize.s1_5,
                        ),
                      ),
                    ),
                    Text(
                      AppStrings.or,
                      style: getBoldStyle(
                          color: Colormanager.darkGrey, fontSize: FontSize.s18),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p4,
                        ),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.loginPhoneRoute);
                },
                child: Container(
                  height: AppSize.s45,
                  margin: const EdgeInsets.symmetric(
                    vertical: AppSize.s16,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        AppSize.s10,
                      ),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colormanager.primary,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(AppPadding.p4),
                              topLeft: Radius.circular(AppPadding.p4),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.phone,
                            color: Colormanager.white,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colormanager.darkPrimary,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(AppPadding.p4),
                              topRight: Radius.circular(AppPadding.p4),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            AppStrings.loginWithPhone,
                            style: getBoldStyle(
                                color: Colormanager.white,
                                fontSize: FontSize.s14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.registerRoute);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: AppMargin.m4,
                  ),
                  padding: const EdgeInsets.all(
                    AppPadding.p14,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(AppStrings.donhaveAccount,
                          style: getBoldStyle(
                            color: Colormanager.black54,
                            fontSize: FontSize.s16,
                          )),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      Text(
                        AppStrings.register,
                        style: getBoldStyle(
                          color: Colormanager.primary,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.transparent,//Colormanager.lightGrey.withOpacity(0.5),
        height: AppSize.s50,
        padding: const EdgeInsets.all(AppPadding.p4),
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Develop by Creative Software',
              style: getMediumStyle(
                  color: Colormanager.black, fontSize: FontSize.s16),
            ),
            Text(
              'version: 1.0.1+15',
              //Platform.operatingSystemVersion,
              style: getMediumStyle(
                  color: Colormanager.darkGrey, fontSize: FontSize.s14),
            ),
          ],
        ),
      ),
    );
  }
}
