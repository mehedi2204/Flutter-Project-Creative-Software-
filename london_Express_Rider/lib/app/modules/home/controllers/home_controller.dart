// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amvines_rider_new/app/modules/home/model/dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:amvines_rider_new/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController with StateMixin<Dashboard> {
  HomeProvider provider;
  HomeController({
    required this.provider,
  });

  @override
  void onInit() {
    getDashBoardData();
    super.onInit();
  }

  getDashBoardData() async {
    change(null, status: RxStatus.loading());
    await provider.getDashboardData().then((value) {
      try {
        change(Dashboard.fromJson(json.decode(value)),
            status: RxStatus.success());
      } catch (exp) {
        if (kDebugMode) {
          print(exp);
        }
        change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
