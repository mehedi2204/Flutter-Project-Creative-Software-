import 'dart:convert';

import 'package:amvines_rider_new/app/modules/transferorderreport/providers/transferorderreport_provider.dart';
import 'package:amvines_rider_new/app/modules/transferreq/model/transfer_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferderreportController extends GetxController
    with StateMixin<List<TransferData>> {
  TransferderreportProvider? provider;
  TransferderreportController({required this.provider});

  Rx<DateTime> formdate = DateTime.now().subtract(const Duration(days: 1)).obs;
  Rx<DateTime> todate = DateTime.now().obs;

  @override
  void onInit() {
    getTransferOdrderList();
    super.onInit();
  }

/*
  Get All Collect Order Report By Date
 */
  getTransferOdrderList() async {
    change(null, status: RxStatus.loading());

    await provider!
        .getTransferOdrderList(formdate: formdate, todate: todate)
        .then((value) {
      try {
        final body = json.decode(value);

        change(TransferResponse.fromJson(body).data,
            status: RxStatus.success());
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
