import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_constant.dart';
import '../../../const/size_config.dart';
import '../../../gb_widgets/button.dart';
import '../controllers/forgotpassword_controller.dart';

class CheckOtpView extends GetView<ForgotpasswordController> {
  const CheckOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.code.value.clear();

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColorsConst.dPrimaryColor,
          title: Text("Check Otp".tr.toString()),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: SizeConfig.screenHight,
            width: SizeConfig.screenWidth,
            child: Form(
              key: controller.fromKeyCheckOtp,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: SizeConfig.screenHight! / 3,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Lottie.asset("assets/lottie/enter_otp.json"),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text('Forgot Password',
                        //'Merchant Panel',
                        style: GoogleFonts.frederickaTheGreat(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
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
                              controller: controller.code.value,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(fontSize: 2.5 * 6),
                              cursorColor: Colors.greenAccent,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  labelText: 'OTP CODE',
                                  hintText: 'enter valid 4 digit otp code',
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
                              maxLength: 4,
                              onChanged: (value) {},
                              validator: (String? value) =>
                                  controller.validCode(value!),
                              // onSaved: (String? value) {
                              //   controller.code = value!;
                              // },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButtton(
                          press: () {
                            //print('lkjlksdjg');
                            controller.getNextpage();
                          },
                          title: 'VERIFY CODE',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
