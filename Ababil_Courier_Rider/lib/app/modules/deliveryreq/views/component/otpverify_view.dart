// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../../../../const/account_level.dart';
// import '../../../../gb_widgets/submit_button.dart';
// import '../../controllers/otpVerifyController .dart';
//
// class OtpVerifyView extends StatelessWidget {
//   const OtpVerifyView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final controller = Get.find<OtpVerifyController>();
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Form(
//             key: controller.keyFromVery,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 InkWell(
//                   onTap: () => Get.back(),
//                   child: Padding(
//                     padding: const EdgeInsets.all(14),
//                     child: Row(
//                       children: [
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.black,
//                           semanticLabel: 'Back',
//                           size: 22,
//                         ),
//                         Text(
//                           'Back',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                           )
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView(
//                     shrinkWrap: true,
//                     physics: const BouncingScrollPhysics(
//                         parent: AlwaysScrollableScrollPhysics()),
//                     children: [
//                       Center(
//                         child: Image.asset('assets/png/rider.png'), //App Logo
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 0.0, vertical: 0),
//                         child: RichText(
//                           text: TextSpan(
//                               text: "Enter the code sent to ",
//                               children: [
//                                 TextSpan(
//                                     text: controller.trkId,
//                                     style: const TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15)),
//                               ],
//                               style: const TextStyle(
//                                   color: Colors.black54, fontSize: 15)),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 00.0, vertical: 0),
//                         child: RichText(
//                           text: const TextSpan(
//                               text: "Time Remaining:",
//                               children: [
//                                 TextSpan(
//                                     text: "30 S",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15)),
//                               ],
//                               style: TextStyle(
//                                   color: Colors.black54, fontSize: 15)),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       PinCodeTextField(
//                         appContext: context,
//                         pastedTextStyle: TextStyle(
//                           color: Colors.green.shade600,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         length: 4,
//                         obscureText: true,
//                         obscuringCharacter: '*',
//                         // obscuringWidget: const FlutterLogo(
//                         //   size: 50,
//                         // ),
//                         blinkWhenObscuring: true,
//                         animationType: AnimationType.fade,
//                         validator: (v) {
//                           if (v!.length != 4) {
//                             return "invalid otp code";
//                           } else {
//                             return null;
//                           }
//                         },
//                         pinTheme: PinTheme(
//                             shape: PinCodeFieldShape.box,
//                             borderRadius: BorderRadius.circular(5),
//                             fieldHeight: 60,
//                             fieldWidth: 60,
//                             activeFillColor: Colors.white,
//                             inactiveColor: Colors.green,
//                             inactiveFillColor: Colors.white,
//                             selectedColor: Colors.red,
//                             selectedFillColor: Colors.white),
//                         cursorColor: Colors.black,
//                         animationDuration: const Duration(milliseconds: 300),
//                         enableActiveFill: true,
//                         errorAnimationController: controller.errorController,
//                         controller: controller.codeController,
//                         keyboardType: TextInputType.number,
//                         boxShadows: const [
//                           BoxShadow(
//                             offset: Offset(0, 1),
//                             color: Colors.black12,
//                             blurRadius: 10,
//                           )
//                         ],
//                         onCompleted: (v) {
//                           debugPrint("Completed");
//                         },
//                         // onTap: () {
//                         //   print("Pressed");
//                         // },
//                         onChanged: (value) {
//                           debugPrint(value);
//                           controller.code.value = value;
//                           // setState(() {
//                           //   currentText = value;
//                           // });
//                         },
//                         beforeTextPaste: (text) {
//                           debugPrint("Allowing to paste $text");
//                           //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                           //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                           return true;
//                         },
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                         child: Text(
//                           controller.hasError.value
//                               ? "*Invalid otp code you have provide"
//                               : "",
//                           style: const TextStyle(
//                               color: Colors.red,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       SubmitButton(
//                         title: 'Get Verify',
//                         press: () {
//                              //Get.toNamed(Routes.OTPVERIFY);
//                           controller.getVerify();
//                         },
//                       ),
//                       SizedBox(height: height * .07),
//                       AccountLevel(
//                         lblText1: 'Did\'t received the code?',
//                         lblText2: 'RESEND',
//                         press: () {
//                           Get.back();
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
