// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../../../const/storage_healper.dart';
// import '../../../gb_widgets/custom_progress_dialog.dart';
// import '../../../gb_widgets/custom_snakebar.dart';
// import '../../../routes/app_pages.dart';
// import '../providers/login_api.dart';
//
// class OtpVerifyController extends GetxController {
//   String trkId;
//   OtpVerifyController({
//     required this.trkId,
//   });
//   late GlobalKey<FormState> keyFromVery = GlobalKey<FormState>();
//   StreamController<ErrorAnimationType>? errorController =
//       StreamController<ErrorAnimationType>();
//
//   final codeController = TextEditingController();
//   RxBool hasError = false.obs;
//   var code = ''.obs;
//
//   getvalidation() {
//     final isValid = keyFromVery.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     // conditions for validating
//     if (code.value.length != 4) {
//       errorController!
//           .add(ErrorAnimationType.shake); // Triggering error shake animation
//       hasError.value = true;
//       return;
//     }else(
//         getVerify()
//     );
//
//   }
//
//   getVerify() async {
//     showLoaderDialog(Get.context);
//       LoginApi.getOtpVarify(otp_code: codeController.toString(), trkId: trkId)
//           .then((value) {
//         try {
//           //var body = json.decode(value);
//           // if (body['status'] == true) {
//           Get.back();
//           //Get.find<HomeController>().getDashBoardData();
//           customSnakebar(
//               icon: Icons.check,
//               title: 'Success Message !',
//               description: 'Delivered Successfully',
//               snackPosition: SnackPosition.TOP,
//               color: const Color.fromARGB(255, 11, 134, 75));
//           // } else {
//           //   Get.back();
//           //   getpickupreqlist(false);
//           //   customSnakebar(
//           //       icon: Icons.error,
//           //       title: 'Error Message !',
//           //       description: 'Something went to wrong ! Please try again .',
//           //       color: const Color.fromARGB(255, 249, 17, 0));
//           // }
//         } catch (exp) {
//           Get.back();
//           customSnakebar(
//               icon: Icons.error,
//               title: 'Error Message !',
//               description: 'Something went to wrong ! Please try again .',
//               color: const Color.fromARGB(255, 249, 17, 0));
//         }
//       }).onError((error, stackTrace) {
//         Get.back();
//         customSnakebar(
//             icon: Icons.error,
//             title: 'Error Message !',
//             description: 'Something went to wrong !',
//             color: const Color.fromARGB(255, 249, 17, 0));
//       });
//     }
//
//   @override
//   void onClose() {
//     //codeController.dispose();
//
//     FocusScope.of(Get.context!).requestFocus();
//     super.onClose();
//   }
// }
