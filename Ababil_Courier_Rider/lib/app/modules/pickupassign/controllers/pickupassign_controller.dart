import 'dart:convert';

import 'package:amvines_rider_new/app/modules/home/controllers/home_controller.dart';
import 'package:amvines_rider_new/app/modules/pickupreq/model/pickupreq.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:amvines_rider_new/app/modules/pickupreq/providers/pickupreq_provider.dart';

import '../../../gb_widgets/custom_progress_dialog.dart';
import '../../../gb_widgets/custom_snakebar.dart';
import '../model/pickupassign.dart';
import '../providers/pickupassign_provider.dart';

class PickupassignController extends GetxController
    with StateMixin<List<PickupAssign>> {
  PickupassignProvider provider;
  PickupassignController({
    required this.provider,
  });
  @override
  void onInit() {
    getpickupassignlist();
    super.onInit();
  }

/*
  Get All Pickup Req by token
 */
  getpickupassignlist() async {
      change(null, status: RxStatus.loading());

    await provider.getpickupassignlist().then((value) {
      try {
        final body = json.decode(value);
        print(body.toString());
      change(PickupAssignModel.fromJson(body).data,
        status: RxStatus.success());
    }catch (exp) {
      print(exp.toString());
      change(null, status: RxStatus.error('Something went to wrong !'));
      }
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

/*
  Cancel Oder By Tracking Id
 */
  getOrderCancel({required String? trkId}) async{
    showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
              title: const Text('Pick Up Request!'),
              content: const Text("Are you sure Cancel your Request?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    getCallCancelOder(trkId: trkId);
                  },
                  child: const Text("Ok"),
                ),
              ],
            ));
  }

/*
  Cancel Oder By Tracking Id
 */
  getCallCancelOder({required String? trkId}) async {
    showLoaderDialog(Get.context);
    await provider.getOderCancel(trkId: trkId).then((value) {
      try {
        //var body = json.decode(value) ;

        Get.back();
        getpickupassignlist();
        Get.find<HomeController>().getDashBoardData();
        customSnakebar(
            icon: Icons.error,
            snackPosition: SnackPosition.TOP,
            title: 'Success Message !',
            description: 'Pickup Cancelled Successfully !',
            color: const Color.fromARGB(255, 7, 107, 54));
      } catch (exp) {
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message!',
            description: 'Something went to wrong !',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      Get.back();
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message!',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }

/*
  Collect Oder By Tracking Id
 */
  getOrderAssign({required String trkId}) async {
    showLoaderDialog(Get.context);
    await provider!.getOderAssign(trkId: trkId).then((value) {
      try {
        if(kDebugMode){
          print(value);
        }
        var body = json.decode(value);
        if(body.toString() == "Order Collect Successfully"){
          Get.back();
          customSnakebar(
              icon: Icons.check,
              title: 'Success Message !',
              description: 'Pickup Collect Successfully',
              snackPosition: SnackPosition.TOP,
              color: const Color.fromARGB(255, 11, 134, 75));
          getpickupassignlist();
        } else{
          Get.back();
          customSnakebar(
              icon: Icons.error,
              title: 'Error Message!',
              description: 'Something went to wrong ! Please try again .',
              color: const Color.fromARGB(255, 249, 17, 0));
        }
      } catch (exp) {
        Get.back();
        customSnakebar(
            icon: Icons.error,
            title: 'Error Message!',
            description: 'Something went to wrong ! Please try again .',
            color: const Color.fromARGB(255, 249, 17, 0));
      }
    }).onError((error, stackTrace) {
      Get.back();
      customSnakebar(
          icon: Icons.error,
          title: 'Error Message!',
          description: 'Something went to wrong !',
          color: const Color.fromARGB(255, 249, 17, 0));
    });
  }
}
