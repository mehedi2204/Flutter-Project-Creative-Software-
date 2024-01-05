// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amvines_rider_new/app/gb_widgets/custom_progress_dialog.dart';
import 'package:amvines_rider_new/app/modules/transferreq/model/transfer_response.dart';
import 'package:amvines_rider_new/app/modules/transferreq/providers/transfer_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gb_widgets/custom_snakebar.dart';

class TransferController extends GetxController
    with StateMixin<List<TransferData>> {
  TransferProvider? provider;
  TransferController({
    required this.provider,
  });

  final controllerCode = TextEditingController();
  // RxBool isLoading = false.obs;
  @override
  void onInit() {
    getTransferOdrderList();
    super.onInit();
  }

/*
  Get All Pickup Req by token
 */
  getTransferOdrderList() async {
    change(null, status: RxStatus.loading());

    await provider!.getTransferOdrderList().then((value) {
      try {
        final body = json.decode(value);
        print(body.toString());
        change(TransferResponse.fromJson(body).data,
            status: RxStatus.success());
      } catch (exp) {
        print(exp.toString());
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

/*
  Return Oder By Tracking Id
 */
  getConfirm({
    required String invoiceId,
  }) async {
    showLoaderDialog(Get.context);
    await provider!.getConfirm(invoiceId: invoiceId).then((value) {
      try {
        if (kDebugMode) {
          print(value);
        }
        var body = json.decode(value);
        if (body['status'] == true) {
          Get.back();
          controllerCode.clear();

          customSnakebar(
              icon: Icons.error,
              snackPosition: SnackPosition.TOP,
              title: 'Success Message !',
              description: body['msg'].toString(),
              color: const Color.fromARGB(255, 7, 107, 54));
          getTransferOdrderList();
        } else {
          Get.back();

          customSnakebar(
              icon: Icons.error,
              title: 'Error Message !',
              description: body['msg'].toString(),
              color: const Color.fromARGB(255, 249, 17, 0));
        }
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
}
