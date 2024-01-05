/*
  Show Customer Varify Dialog
 */
import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:amvines_rider_new/app/gb_widgets/custom_snakebar.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/controllers/deliveryreq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getExchaneDialog(
    {required String trkid, required DeliveryreqController controller}) {
  Get.defaultDialog(
      title: 'Order Exchange Dialog',
      onWillPop: () async {
        controller.controllerCode.clear();
        controller.collectionController.clear();
        controller.noteController.clear();
        return false;
      },
      titleStyle: CustomThemes().titleStyle.copyWith(
          color: const Color.fromARGB(255, 249, 17, 0),
          fontWeight: FontWeight.bold),
      actions: [
        Obx(() => SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (controller.isLoader.value == true)
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      ),
                    ),
                  if (controller.isLoader.value != true)
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.controllerCode.clear();
                              controller.collectionController.clear();
                              controller.noteController.clear();
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (controller.noteController.text.isNotEmpty ||
                                  controller
                                      .collectionController.text.isNotEmpty ||
                                  controller.controllerCode.text.isNotEmpty) {
                                controller.getPartiallyDelivery(
                                    trkId: trkid,
                                    securityCode: controller.controllerCode.text
                                        .toString(),
                                    note: controller.noteController.text,
                                    collection: controller
                                        .collectionController.text
                                        .toString());
                                //Get.back();
                              } else {
                                customSnakebar(
                                    icon: Icons.error,
                                    title: 'Error Message !',
                                    description: 'Empty Field not allowed ! ',
                                    color:
                                        const Color.fromARGB(255, 249, 17, 0));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColorsConst.dPrimaryColor,
                            ),
                            child: const Text(
                              'VERIFY CODE',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ))
      ],
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.controllerCode,
            textInputAction: TextInputAction.next,

            style: CustomThemes().titleStyle,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'security code here'),
            // validator: (value) {
            //   return controller.validFields(value!);
            // },
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller.collectionController,
            textInputAction: TextInputAction.next,

            style: CustomThemes().titleStyle,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Collection amount here'),
            // validator: (value) {
            //   return controller.validFields(value!);
            // },
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller.noteController,
            textInputAction: TextInputAction.done,

            style: CustomThemes().titleStyle,
            keyboardType: TextInputType.text,
            maxLines: 2,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'order note here'),
            // validator: (value) {
            //   return controller.validFields(value!);
            // },
          ),
        ],
      ),
      radius: 10.0,
      barrierDismissible: true);
}
