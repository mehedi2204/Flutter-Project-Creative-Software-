// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../gb_widgets/custom_progress_dialog.dart';
// import '../../../gb_widgets/custom_snakebar.dart';
// import '../../../routes/app_pages.dart';
// import '../providers/login_api.dart';
// import 'otpVerifyController .dart';
//
// class OtpController extends GetxController {
//   final formKey = GlobalKey<FormState>();
//
//   final invoiceIdController = TextEditingController();
// //Form Validation Check
//   getValidate() {
//     var valid = formKey.currentState!.validate();
//     if (kDebugMode) {
//       print(valid);
//     }
//
//     if (!valid) {
//       if (kDebugMode) {
//         print('emapt');
//       }
//       return;
//     } else {
//       if (kDebugMode) {
//         print('Not emapt');
//       }
//       var mobile = invoiceIdController.text.toString();
//       print(mobile);
//
//       getLogin(invoiceId: mobile);
//     }
//   }
//
//   //Get Login Attempt
//   getLogin({required String invoiceId}) async {
//     showLoaderDialog(Get.context);
//     try {
//       LoginApi.getOtplogin(trkId: invoiceId).then((value) {
//         final response = json.decode(value);
//         print(value);
//         Get.back();
//         if (response['status'] == true) {
//           Get.put<OtpVerifyController>(OtpVerifyController(trkId: invoiceId));
//           Get.toNamed(Routes.OTPVerifyRoute);
//         } else {
//           customSnakebar(
//               title: 'Invalid Form',
//               description: 'Something went to wrong !',
//               color: Colors.red,
//               icon: Icons.info,
//               snackPosition: SnackPosition.TOP);
//         }
//       }).onError((error, stackTrace) {
//         Get.back();
//         customSnakebar(
//             title: 'Invalid Form',
//             description: 'Something went to wrong !',
//             color: Colors.red,
//             icon: Icons.info,
//             snackPosition: SnackPosition.TOP);
//       });
//     } catch (error) {
//       if (kDebugMode) {
//         print(error);
//       }
//       Get.back();
//       customSnakebar(
//           title: 'Invalid Form',
//           description: 'Something went to wrong !',
//           color: Colors.red,
//           icon: Icons.info,
//           snackPosition: SnackPosition.TOP);
//     }
//   }
//
//   @override
//   void onClose() {
//     // mobileController.dispose();
//     FocusScope.of(Get.context!).requestFocus();
//     super.onClose();
//   }
// }
