// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/total_delivered_response.dart';
import '../providers/total_delivered_provider.dart';


class TotalDeliveredController extends GetxController
    with StateMixin<List<TotalDeliveredData>> {
  TotalDeliveredProvider? provider;
  TotalDeliveredController({
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

    await provider!.getTotalDeliveredList().then((value) {
      try {
        final body = json.decode(value);
        print(body.toString());
        change(TotalDeliverdResponse.fromJson(body).data,
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
