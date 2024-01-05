// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/todaydelivered_response.dart';
import '../providers/todaydelivered_provider.dart';


class TodayDeliveredController extends GetxController
    with StateMixin<List<TodayDeliveredData>> {
  TodayDeliveredProvider? provider;
  TodayDeliveredController({
    required this.provider,
  });

  final controllerCode = TextEditingController();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getTodayDeliveredList();
    super.onInit();
  }

/*
  Get All Pickup Req by token
 */
  getTodayDeliveredList() async {
    change(null, status: RxStatus.loading());

    await provider!.getTodayDeliveredList().then((value) {
      try {
        final body = json.decode(value);
        print(body.toString());
        change(TodayDeliverdResponse.fromJson(body).data,
            status: RxStatus.success());
      } catch (exp) {
        print(exp.toString());
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
