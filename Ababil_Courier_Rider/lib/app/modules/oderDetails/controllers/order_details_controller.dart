// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amvines_rider_new/app/modules/confirmorderreport/model/order_response.dart';
import 'package:amvines_rider_new/app/modules/oderDetails/model/order_details_response.dart';
import 'package:amvines_rider_new/app/modules/oderDetails/providers/orderreturn_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController
    with StateMixin<List<ConfirmOrderReportData>> {
  OrderDetailsProvider? provider;
  OrderDetailsController({
    required this.provider,
  });

  final controllerCode = TextEditingController();
  RxBool isLoading = false.obs;
  String? invoiceId;

/*
  Get All Pickup Req by token
 */
  getReturnOdrderList({required String invoiceId}) async {
    this.invoiceId = invoiceId;
    change(null, status: RxStatus.loading());

    await provider!.getReturnOdrderList(invoiceId: invoiceId).then((value) {
      try {
        final body = json.decode(value);

        change(OrderResponse.fromJson(body).order,
            status: RxStatus.success());
      } catch (exp) {
        if (kDebugMode) {
          print('nmfgklshdgkjskjgdsjhg');
          print(exp);
        }
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

/*
  Get All Pickup Req by token
 */
  getTransferOrderList({required String invoiceId}) async {
    this.invoiceId = invoiceId;
    change(null, status: RxStatus.loading());

    await provider!.getTransferOdrderList(invoiceId: invoiceId).then((value) {
      try {
        final body = json.decode(value);

        change(OrderResponse.fromJson(body).order,
            status: RxStatus.success());
      } catch (exp) {
        if (kDebugMode) {
          print('nmfgklshdgkjskjgdsjhg');
          print(exp);
        }
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
