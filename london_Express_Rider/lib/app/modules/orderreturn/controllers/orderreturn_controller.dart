// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:amvines_rider_new/app/modules/orderreturn/model/orderreturn_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:amvines_rider_new/app/modules/orderreturn/providers/orderreturn_provider.dart';

import '../../../gb_widgets/custom_snakebar.dart';

class OrderreturnController extends GetxController
    with StateMixin<ReturnOrderResponse> {
  OrderreturnProvider? provider;
  OrderreturnController({
    required this.provider,
  });

  final controllerCode = TextEditingController();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getReturnOdrderList(true);
    super.onInit();
  }

/*
  Get All Pickup Req by token
 */
  getReturnOdrderList(bool isLoad) async {
    if (isLoad) {
      change(null, status: RxStatus.loading());
    }

    await provider!.getReturnOdrderList().then((value) {
      try {
        final body = json.decode(value);

        change(ReturnOrderResponse.fromJson(body), status: RxStatus.success());
      } catch (exp) {
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

/*
  Return Oder By Tracking Id
 */
  getOrderReturn(
      {required String invoiceId, required String seCurityCoe}) async {
    isLoading.value = true;
    await provider!
        .getOrderReturn(invoiceId: invoiceId, securityCode: seCurityCoe)
        .then((value) {
      try {
        if (kDebugMode) {
          print(value);
        }
        var body = json.decode(value);
        if (body['status'] == true) {
          isLoading.value = true;
          Get.back();
          controllerCode.clear();

          customSnakebar(
              icon: Icons.error,
              snackPosition: SnackPosition.TOP,
              title: 'Success Message !',
              description: body['msg'].toString(),
              color: const Color.fromARGB(255, 7, 107, 54));
          getReturnOdrderList(false);
        } else {
          isLoading.value = false;

          customSnakebar(
              icon: Icons.error,
              title: 'Error Message !',
              description: body['msg'].toString(),
              color: const Color.fromARGB(255, 249, 17, 0));
        }
      } catch (exp) {
        isLoading.value = false;
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message !',
            description: 'Something went to wrong !',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
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
  getVerifyDialog({required String invoiceId}) {
    Get.defaultDialog(
        title: 'User Verification Dialog !',
        onWillPop: () async {
          controllerCode.clear();
          isLoading.value = false;
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
                  labelText: 'Enter Sequrity Code',
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
                      if (isLoading.value == true)
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.redAccent,
                          ),
                        ),
                      if (isLoading.value == false)
                        ElevatedButton(
                          onPressed: () {
                            if (controllerCode.text.isNotEmpty &&
                                controllerCode.text.length == 4) {
                              //Get.back();
                              getOrderReturn(
                                  invoiceId: invoiceId,
                                  seCurityCoe: controllerCode.text.toString());
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
                    ],
                  ),
                ))
          ],
        ),
        radius: 10.0,
        barrierDismissible: true);
  }
}
