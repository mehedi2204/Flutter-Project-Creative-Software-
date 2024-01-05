import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lbdl_merchant/data/model/categories.dart';
import 'package:lbdl_merchant/data/model/confirm_orders_response.dart';
import 'package:lbdl_merchant/data/model/coverage_area_response.dart';
import 'package:lbdl_merchant/data/model/pickup_time_response.dart';

import 'package:lbdl_merchant/data/remote/order_api.dart';
import 'package:lbdl_merchant/presentation/screens/resources/string_manager.dart';
import 'package:intl/intl.dart';

import '../../data/model/shopsresponse.dart';

class OrderController extends GetxController with StateMixin<List<Order>> {
  OrderApi orderApi;
  OrderController({
    required this.orderApi,
  });

  List<Shop> shops = <Shop>[].obs;
  List<CoverageArea> coverageAreas = <CoverageArea>[].obs;
  List<ProductType> categories = <ProductType>[].obs;
  List<PickupTime> pickuptimes = <PickupTime>[].obs;
  Shop? selectedShop;
  CoverageArea? selectedArea;
  Category? selectedCatefory;
  PickupTime? selectedPickupTime;
  var selectShop = '--- Select Shop ---'.obs;
  var selectArea = '--- Select Area ---'.obs;
  var selectCategory = '--- Select Category ---'.obs;
  var selectPickupTime = '--- Select Pickup Time ---'.obs;
  var formDate = DateTime.now().obs;
  var todate = DateTime.now().obs;
  String fDate = '';
  String tDate = '';
  @override
  void onInit() {
    fDate = DateFormat('yyyy-MM-dd')
        .format(formDate.value.subtract(const Duration(days: 7)));
    tDate = DateFormat('yyyy-MM-dd').format(todate.value);
    getConfirmOrders();
    super.onInit();
  }

  //Email Validation
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return AppStrings.provideEmail;
    }
    return null;
  }

  //Phone Validation
  String? validatePhone(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return AppStrings.providePhone;
    }
    if (value.length != 11) {
      return AppStrings.providePhone;
    }
    return null;
  }

  //Valid Empty Fields
  String? validFields(String value) {
    if (value.isEmpty) {
      return AppStrings.emptyFields;
    }
    return null;
  }

  //Get Dashboard Data
  getConfirmOrders() async {
    change(null, status: RxStatus.loading());

    try {
      orderApi.getConfirmOrders(formDate: fDate, today: tDate).then((value) {
        var body = json.decode(value);

        change(ConfirmOrdersResponse.fromJson(body).data ?? [],
            status: RxStatus.success());
        if (kDebugMode) {
          print(value);
        }
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error(AppStrings.somthingWentWrong));
        if (kDebugMode) {
          print(value);
        }
      });
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
      if (kDebugMode) {
        print(value);
      }
    }
  }

  Future<void> selectToDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: todate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      tDate = DateFormat('yyyy-MM-dd').format(picked);
      todate.value = picked;
    }
  }

  Future<void> selectFromDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: formDate.value,
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));
    if (picked != null) {
      fDate = DateFormat('yyyy-MM-dd').format(picked);
      if (kDebugMode) {
        print(fDate);
      }
      formDate.value = picked;
    }
  }

  dateFormet(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
