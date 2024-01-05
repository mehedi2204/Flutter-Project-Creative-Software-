import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../const/string_manager.dart';
import '../../../../const/text_style_constant.dart';
import '../../../../const/values_manager.dart';
import '../../../../const/widgets/app_text.dart';
import '../../../../const/widgets/submit_button.dart';
import '../../../../const/widgets/user_input_fields.dart';
import '../../../../routes/app_pages.dart';

class StaffSigninPhone extends StatelessWidget {
  const StaffSigninPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final controller = Get.put(OtpController(), permanent: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      semanticLabel: 'back',
                      size: 22,
                    ),
                    Text(
                      'Back',
                      style: getSemiBoldStyle(
                          color: Colors.black, fontSize:18),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      // key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: height * .15),
                          Center(
                            child:
                            Image.asset('assets/logo.png'), //App Logo
                          ),
                          SizedBox(height: height * .07),
                          UserInputFields(
                            lavelName: AppStrings.mMobile,
                            histsName: AppStrings.enterMobile,
                            // controller: controller.mobileController,
                            iconData: Icons.mobile_friendly,
                            validateFunction: (value) {},
                            // controller.validatePhone(value),
                            textInputType: TextInputType.number,
                            press: () {},
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SubmitButton(
                            title: 'Get otp code',
                            press: () {
                              Get.toNamed(Routes.DASHBOARD);
                              // Get.toNamed(Routes.OTPVERIFY);
                              // controller.getValidate();
                            },
                          ),
                          // SizedBox(height: height * .07),
                          // InkWell(
                          //   onTap: () {
                          //     Get.back();
                          //   },
                          //   child: Container(
                          //     margin: const EdgeInsets.symmetric(
                          //       vertical: 14,
                          //     ),
                          //     padding: const EdgeInsets.all(AppPadding.p14),
                          //     alignment: Alignment.bottomCenter,
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: <Widget>[
                          //         AppText(
                          //           text: AppStrings.alreadyHaveAccount,
                          //           color: Colors.black,
                          //           fontSize: 14,
                          //         ),
                          //         const SizedBox(
                          //           width: AppSize.s10,
                          //         ),
                          //         AppText(
                          //           text: AppStrings.login,
                          //           color: Colors.black,
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    /*return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                // SizedBox(height: MediaQuery.of(context).size.height*0.5),
                Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(''),
                    // )
                  ),
                  child: Center(
                    child: AppText(text: 'Easy Somity',style: getSemiBoldStyle(fontSize: 25 ,color: CustomColor.dPrimary,),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                            )
                        ),
                        child: Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 70,),
                      Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );*/
  }
}
