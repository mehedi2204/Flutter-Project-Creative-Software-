import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../model/sell_model.dart';
import '../response/sell_repository.dart';

class SellController extends GetxController with StateMixin<List<SellModel>> {
  SellResponse sellResponse;
  var showGrid = true.obs;
  SellController({
    required this.sellResponse,
  });

  toggleGrid() {
    showGrid(!showGrid.value);
  }

  @override
  void onInit() {
    getProductList(true);
    super.onInit();
  }

  getProductList(bool isLoad) async {
    if (isLoad) {
      change(null, status: RxStatus.loading());
    }
    await sellResponse.getProductList().then((value) {
      if (kDebugMode) {
        print((value));
      }
      List body = json.decode(value) as List;
      final data = body.map((d) => SellModel.fromJson(d)).toList();
      change(data, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
