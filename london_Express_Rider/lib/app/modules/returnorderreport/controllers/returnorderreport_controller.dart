import 'dart:convert';

import 'package:amvines_rider_new/app/modules/orderreturn/model/orderreturn_response.dart';
import 'package:amvines_rider_new/app/modules/returnorderreport/providers/returnorderreport_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnorderreportController extends GetxController
    with StateMixin<ReturnOrderResponse> {
  ReturnorderreportProvider? provider;
  ReturnorderreportController({required this.provider});
  Rx<DateTime> formdate = DateTime.now().subtract(const Duration(days: 3)).obs;
  Rx<DateTime> todate = DateTime.now().obs;

  @override
  void onInit() {
    getReturnOrderList();
    super.onInit();
  }

  /*
  Get All Confirm Order Report By Date
 */
  getReturnOrderList() async {
    change(null, status: RxStatus.loading());

    await provider!
        .getReturnOrderList(formdate: formdate, todate: todate)
        .then((value) {
      try {
        final body = json.decode(value);
        print(body.toString());
        change(ReturnOrderResponse.fromJson(body), status: RxStatus.success());
      } catch (exp) {
        change(null, status: RxStatus.error('Something went to wrong !'));
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
      // print('Start Date: $_startDate  End Date : $_endDate');

    }
  }
}
