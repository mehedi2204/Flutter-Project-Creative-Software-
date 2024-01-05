import 'dart:convert';

import 'package:amvines_rider_new/app/modules/confirmorderreport/model/order_response.dart';
import 'package:amvines_rider_new/app/modules/confirmorderreport/providers/confirmorderreport_provider.dart';
import 'package:amvines_rider_new/app/modules/confirmorderreport/views/history_filter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../model/orderreport.dart';

class ConfirmorderreportController extends GetxController
    with StateMixin<OrderResponse> {
  ConfirmorderreportProvider? provider;
  ConfirmorderreportController({required this.provider});
  // Rx<TextEditingController> stetusCon = TextEditingController().obs;
  // Rx<TextEditingController> formdateCon = TextEditingController().obs;
  // Rx<TextEditingController> todataCon = TextEditingController().obs;
  Rx<DateTime> formdate = DateTime.now().subtract(const Duration(days: 2)).obs;
  Rx<DateTime> todate = DateTime.now().obs;
  //var selectStatus = 'Pickup Done'.obs;

/*  List<String> statusList = [
    "Pickup Done",
    "Successfully Delivered",
    "Partially Delivered",
    "Cancel Order",
    "PickUp Cancel",
    "Reschedule Order",
    "Hold Order",
  ];*/
  @override
  void onInit() {
    getConfirmOrderList();
    super.onInit();
  }
/*
  getShow() {
    showHistoryModal(Get.context);
  }*/

  /*
  Get All Confirm Order Report By Date
 */
  getConfirmOrderList() async {
    change(null, status: RxStatus.loading());

    await provider!
        .getConfirmOrderList(
            formdate: formdate, todate: todate)
        .then((value) {
      try {
        var body = json.decode(value);
        print(body.toString());
        change(OrderResponse.fromJson(body), status: RxStatus.success());
      } catch (exp) {
        if (kDebugMode) {
          print(exp.toString());
        }
        change(null, status: RxStatus.error('It will be fixed soon !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {}

  /*
  Show Date Picker
 */
  Future displayDateRangePicker(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: initialDateRange,
    );

    if (newDateRange != null) {
      formdate.value = newDateRange.start;
      todate.value = newDateRange.end;
      // print('Start Date: $formdate  End Date : $todate');

    }
  }
}
