import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:amvines_rider_new/app/gb_widgets/custom_progress_dialog.dart';
import 'package:amvines_rider_new/app/gb_widgets/custom_snakebar.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/model/delivery_request.dart';
import 'package:amvines_rider_new/app/modules/home/controllers/home_controller.dart';
import 'package:amvines_rider_new/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/providers/deliveryreq_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

import '../providers/login_api.dart';
import 'otpVerifyController .dart';

class DeliveryreqController extends GetxController
    with StateMixin<List<DeliveryRequest>> {
  DeliveryreqProvider provider;
  final TextEditingController otpContoller = TextEditingController();
  final TextEditingController controllerCode = TextEditingController();
  final TextEditingController collectionController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  SignatureController signatureController = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white);
  var selectedDate = DateTime.now().obs;
  RxInt isVerify = 0.obs;
  String? tracking_id;
  String? invoiceId;
  Rx<File>? image = File('10').obs;
  Rx<File>? signature = File('10').obs;
  Uint8List? sig;

  final picker = ImagePicker();
  RxBool isLoader = false.obs;
  DeliveryreqController({
    required this.provider,
  });

  @override
  void onInit() {
    getDeliveryreqlist(true);

    super.onInit();
  }

  /*
  Get All Pickup Req by token
 */
  getDeliveryreqlist(bool isLoad) async {
    if (isLoad) {
      change(null, status: RxStatus.loading());
    }

    await provider.getDeliveryreqlist().then((value) {
      // try {
      if (kDebugMode) {
        print(value);
      }
      List body = json.decode(value) as List;
      final data = body.map((d) => DeliveryRequest.fromJson(d)).toList();

      change(data, status: RxStatus.success());

      // } catch (exp) {
      //   if (kDebugMode) {
      //     print(exp);
      //   }
      // change(null, status: RxStatus.error('Something went to wrong !'));
      //}
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {
    controllerCode.dispose();
    signatureController.dispose();
  }

/*
  Cancel Oder By Tracking Id
 */
  getAlert({required String? name, required VoidCallback press}) {
    showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
              title: const Text('Delivery Request!'),
              content: Text("Are you sure $name your Request?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                  onPressed: press,
                  child: const Text("Ok"),
                ),
              ],
            ));
  }

/*
  Cancel Request By Tracking Id
 */
  getDeliveryCancel({required String? trkId}) async {
    showLoaderDialog(Get.context);
    await provider.getDeliveryCancel(trkId: trkId!).then((value) {
      try {
        //var body = json.decode(value) ;

        Get.back();
        getDeliveryreqlist(false);
        Get.find<HomeController>().getDashBoardData();
        customSnakebar(
            icon: Icons.error,
            snackPosition: SnackPosition.TOP,
            title: 'Success Message !',
            description: 'Delivery Cancelled Successfully !',
            color: const Color.fromARGB(255, 7, 107, 54));
      } catch (exp) {
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong !',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      Get.back();
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

  /*
  Getm Delivery Option Request By Tracking Id
 */
  getDeliveryOption({
    required String trkId,
    required String type,
    required String note,
    required String date,
  }) async {
    isLoader.value = true;
    if (kDebugMode) {
      print('$trkId-$type-$note-$date');
    }
    await provider
        .getDeliveryOption(trkId: trkId, type: type, note: note, date: date)
        .then((value) {
          print(note.toString());
      try {
        var body = json.decode(value);

        if (body['status']) {
          isLoader.value = false;

          noteController.clear();
          selectedDate.value = DateTime.now();

          Get.back();
          Get.back();

          getDeliveryreqlist(false); //Reload Delivery Request
          Get.find<HomeController>().getDashBoardData(); //Reload Dashboard Data

          customSnakebar(
              icon: Icons.error,
              snackPosition: SnackPosition.TOP,
              title: 'Success Message !',
              description: body['msg'].toString(),
              color: const Color.fromARGB(255, 7, 107, 54));
        } else {
          isLoader.value = false;
          customSnakebar(
              icon: Icons.error,
              title: 'Error Message !',
              description: body['msg'].toString(),
              color: const Color.fromARGB(255, 249, 17, 0));
        }
      } catch (exp) {
        if (kDebugMode) {
          print(exp);
        }
        isLoader.value = false;

        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong !!',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      isLoader.value = false;
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

  /*
  Getm Delivery Option Request By Tracking Id
 */
  getPartiallyDelivery({
    required String trkId,
    required String collection,
    required String note,
    required String securityCode,
  }) async {
    isLoader.value = true;

    await provider
        .getPartiallyDelivery(
            trkId: trkId,
            note: note,
            collection: collection,
            securityCode: securityCode)
        .then((value) {
      try {
        var body = json.decode(value);

        if (body['status']) {
          isLoader.value = false;

          noteController.clear();
          collectionController.clear();
          controllerCode.clear();

          Get.back();

          getDeliveryreqlist(false); //Reload Delivery Request
          Get.find<HomeController>().getDashBoardData(); //Reload Dashboard Data

          customSnakebar(
              icon: Icons.error,
              snackPosition: SnackPosition.TOP,
              title: 'Success Message !',
              description: body['msg'].toString(),
              color: const Color.fromARGB(255, 7, 107, 54));
        } else {
          isLoader.value = false;
          customSnakebar(
              icon: Icons.error,
              title: 'Error Message !',
              description: body['msg'].toString(),
              color: const Color.fromARGB(255, 249, 17, 0));
        }
      } catch (exp) {
        if (kDebugMode) {
          print(exp);
        }
        isLoader.value = false;

        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong !!',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      isLoader.value = false;
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

/*
  Confirm Oder By Tracking Id,Signature and cnfirm Image
 */
  getDeliveryConfirm(
      {required String? trkId,
      required File? confirmImage,
      required File? signatureImage}) async {
    showLoaderDialog(Get.context);
    await provider
        .getDeliveryConfirm(
            trkId: trkId!,
            confirmImage: confirmImage,
            signatureImage: signatureImage)
        .then((value) {
      try {
        value.stream.transform(utf8.decoder).listen((value) {
          if (kDebugMode) {
            print(value);
          }
          var body = json.decode(value);

          if (body['status'] == "true") {
            Get.back();
            getDeliveryreqlist(false);
            Get.find<HomeController>().getDashBoardData();
            Get.back();
            customSnakebar(
                icon: Icons.check,
                title: 'Success Message !',
                description: body['msg'],
                snackPosition: SnackPosition.TOP,
                color: const Color.fromARGB(255, 11, 134, 75));
            signature!.value = File('10');
            image!.value = File('10');
            signatureController.clear();
          } else {
            Get.back();
            getDeliveryreqlist(false);
            customSnakebar(
                icon: Icons.error,
                title: 'Error Message !',
                description: body['msg'],
                color: const Color.fromARGB(255, 249, 17, 0));
          }
        });
      } catch (exp) {
        if (kDebugMode) {
          print(exp);
        }
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong ! Please try again .',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
      }
      Get.back();
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

/*
  Resend Security Code By Tracking ID
 */
  getResendCode({
    required String? trkId,
  }) async {
    await provider
        .getSendCode(
      trkId: trkId!,
    )
        .then((value) {
      try {
        var body = json.decode(value);
        if (body['status'] == true) {
          isVerify.value = 0;

          Get.find<HomeController>().getDashBoardData();
          customSnakebar(
              icon: Icons.check,
              title: 'Success Message !',
              description: body['message'],
              snackPosition: SnackPosition.TOP,
              color: const Color.fromARGB(255, 11, 134, 75));
        } else {
          isVerify.value = 2;
          customSnakebar(
              icon: Icons.error,
              title: 'Error Message !',
              description: body['message'],
              color: const Color.fromARGB(255, 249, 17, 0));
        }
      } catch (exp) {
        isVerify.value = 2;
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong ! Please try again .',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      isVerify.value = 2;
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

/*
  Get Verify user By Tracking Id and code
 */
  getVarifyUser({
    required String? trkId,
    required String? code,
  }) async {
    await provider.getVarifyUser(trkId: trkId!, code: code!).then((value) {
      try {
        var body = json.decode(value);
        if (body['status'] == true) {
          isVerify.value = 0;
          Get.back();
          tracking_id = trkId;
          controllerCode.clear();
          customSnakebar(
              icon: Icons.check,
              title: 'Success Message !',
              description: body['message'],
              snackPosition: SnackPosition.TOP,
              color: const Color.fromARGB(255, 11, 134, 75));
          Get.toNamed(Routes.ORDERRETURN);
        } else {
          isVerify.value = 2;
          customSnakebar(
              icon: Icons.error,
              title: 'Error Message !',
              description: body['message'],
              color: const Color.fromARGB(255, 249, 17, 0));
        }
      } catch (exp) {
        isVerify.value = 2;
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong ! Please try again .',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      isVerify.value = 2;
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

/*
  Show Customer Varify Dialog
 */
  getVerifyDialog({required String? trkid}) {
    Get.defaultDialog(
        title: 'User Verification Dialog !',
        onWillPop: () async {
          isVerify.value = 0;
          controllerCode.clear();
          return true;
        },
        titleStyle: CustomThemes().titleStyle.copyWith(
            color: const Color.fromARGB(255, 249, 17, 0),
            fontWeight: FontWeight.bold),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controllerCode,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                  color: AppColorsConst.dPrimaryColor,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              decoration: const InputDecoration(
                  labelText: 'Enter OTP',
                  hintMaxLines: 1,
                  hintText: '4 Digit Code here',
                  hintStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.bold),
                  labelStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorsConst.dPrimaryColor, width: 4.0))),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Obx(() => SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isVerify.value == 1)
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.redAccent,
                          ),
                        ),
                      if (isVerify.value == 0)
                        ElevatedButton(
                          onPressed: () {
                            if (controllerCode.text.isNotEmpty &&
                                controllerCode.text.length == 4) {
                              isVerify.value = 1;
                              getVarifyUser(
                                  trkId: trkid, code: controllerCode.text);
                              //Get.back();
                            } else {
                              customSnakebar(
                                  icon: Icons.error,
                                  title: 'Error Message !',
                                  description: 'Empty Field not allowed ! ',
                                  color: const Color.fromARGB(255, 249, 17, 0));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                          ),
                          child: const Text(
                            'VERIFY CODE',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      if (isVerify.value == 2)
                        ElevatedButton(
                          onPressed: () {
                            isVerify.value = 1;
                            getResendCode(trkId: trkid);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColorsConst.dPrimaryColor),
                          child: const Text(
                            'RESEND CODE',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                    ],
                  ),
                ))
          ],
        ),
        radius: 10.0,
        barrierDismissible: true);
  }

/*
  Capture Customer Image 
 */
  Future getImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 20,
        maxHeight: 500,
        maxWidth: 500);

    if (pickedFile != null) {
      image!.value = File(pickedFile.path);
    }
  }

/*
  Take Customer Signature 
 */
  Future takeSignature() async {
    sig = await signatureController.toPngBytes();
    try {
      var date = DateTime.now().millisecondsSinceEpoch;
      final tempDir = await getTemporaryDirectory();
      signature!.value = await File('${tempDir.path}/image_$date.png').create();
      signature!.value.writeAsBytesSync(sig!);

      Get.back();
    } catch (e) {
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong ! Please try again .',
          color: const Color.fromARGB(255, 172, 19, 8));
    }
    update();
  }

/*
  Before Confirm Order Validation check and get Confirm method Call 
 */
  getcheckValidation({required String? trkid}) {
    if (trkid == null) {
      print(trkid.toString()+'trackid');
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong ! Please try again .',
          color: const Color.fromARGB(255, 172, 19, 8));
    } else {
      sendOtp(
          trkId: trkid
      );
    }
  }

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
    }
  }

  getDelivered({required String? trkId}) async {
    // showLoaderDialog(Get.context);
    await provider.getDelevered(trkId: trkId).then((value) {
      try {
        //var body = json.decode(value);
        // if (body['status'] == true) {
        Get.back();
        getDeliveryreqlist(false);
        Get.find<HomeController>().getDashBoardData();
        customSnakebar(
            icon: Icons.check,
            title: 'Success Message !',
            description: 'Delivered Successfully',
            snackPosition: SnackPosition.TOP,
            color: const Color.fromARGB(255, 11, 134, 75));
        // } else {
        //   Get.back();
        //   getpickupreqlist(false);
        //   customSnakebar(
        //       icon: Icons.error,
        //       title: 'Error Message !',
        //       description: 'Something went to wrong ! Please try again .',
        //       color: const Color.fromARGB(255, 249, 17, 0));
        // }
      } catch (exp) {
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong ! Please try again .',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      Get.back();
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

  sendOtp({required String? trkId}) async {
    showLoaderDialog(Get.context);
    await provider.sendOTP(trkId: trkId).then((value) {
      try{
        Get.back();
        Get.back();

        getDeliveryreqlist(false); //Reload Delivery Request
        Get.find<HomeController>().getDashBoardData();

        customSnakebar(
            icon: Icons.check,
            title: 'Success Message !',
            description: 'OTP Send Successfully',
            snackPosition: SnackPosition.TOP,
            color: const Color.fromARGB(255, 11, 134, 75));
      }catch (exp) {
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong ! Please try again .',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      Get.back();
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

  OtpVerfy({required String? trkId, String? otp_code}) async {
    showLoaderDialog(Get.context);
    await provider.getOtpVarify(trkId: trkId, otp_code: otp_code).then((value) {
      print("otp in controller:  "+otp_code.toString());
      try{
        Get.back();
        Get.back();

        getDeliveryreqlist(false); //Reload Delivery Request
        Get.find<HomeController>().getDashBoardData();

        customSnakebar(
            icon: Icons.check,
            title: 'Success Message !',
            description: 'OTP Send Successfully',
            snackPosition: SnackPosition.TOP,
            color: const Color.fromARGB(255, 11, 134, 75));
      }catch (exp) {
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong ! Please try again .',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      Get.back();
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message !',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

}
