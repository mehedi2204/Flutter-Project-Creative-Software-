/*
  Show Customer Varify Dialog
 */
import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:amvines_rider_new/app/gb_widgets/custom_snakebar.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/controllers/deliveryreq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

getOptionsDialog(
    {required String trkid,
    required String type,
    required DeliveryreqController controller}) {
  Get.defaultDialog(
      title: 'Order $type',
      onWillPop: () async {
        controller.noteController.clear();
        controller.controllerCode.clear();
        controller.selectedDate.value = DateTime.now();
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
                              controller.noteController.clear();
                              controller.selectedDate.value = DateTime.now();
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
                              if (controller.noteController.text.isNotEmpty) {
                                controller.getDeliveryOption(
                                    trkId: trkid,
                                    type: type,
                                    note: controller.noteController.text,
                                    date: controller.selectedDate.toString());
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
                              'Submit',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Comment',
                      style: CustomThemes().subTitleStyle,
                    ),
                    const TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ],
                ),
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
                    border: OutlineInputBorder(), hintText: 'Comment here'),
                // validator: (value) {
                //   return controller.validFields(value!);
                // },
              ),
            ],
          ),
          if (type == 'schedule')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Recheduled Date',
                        style: CustomThemes().titleStyle,
                      ),
                      const TextSpan(
                        text: '*',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                        width: 1.5, color: AppColorsConst.dTextColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              DateFormat('dd-MM-yyyy').format(
                                DateTime.parse(
                                    controller.selectedDate.toString()),
                              ),
                              style: CustomThemes().subTitleStyle),
                          InkWell(
                              onTap: () {
                                controller.selectDate();
                              },
                              child: const Icon(Icons.date_range))
                        ],
                      )),
                ),
              ],
            ),
        ],
      ),
      radius: 10.0,
      barrierDismissible: true);
}

getOtopDialog(
    {required String trkid,
      //required String otp_code,
      required String type,
      required DeliveryreqController controller}) {
  Get.defaultDialog(
      title: 'Order $type',
      onWillPop: () async {
        controller.otpContoller.clear();
        //controller.noteController.clear();
        //controller.controllerCode.clear();
        //controller.selectedDate.value = DateTime.now();
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
                          controller.otpContoller.clear();
                          //controller.controllerCode.clear();
                          //controller.noteController.clear();
                          //controller.selectedDate.value = DateTime.now();
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
                          if (controller.otpContoller.text.isNotEmpty &&
                              controller.otpContoller.text.length == 4) {
                            controller.OtpVerfy(
                                trkId: trkid,
                                otp_code: controller.otpContoller.text,

                                //note: controller.noteController.text,
                              /*date: controller.selectedDate.toString()*/);
                            Get.back();
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
                          'Submit',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'OTP Code',
                      style: CustomThemes().subTitleStyle,
                    ),
                    const TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: controller.otpContoller,
                textInputAction: TextInputAction.done,

                style: CustomThemes().titleStyle,
                keyboardType: TextInputType.text,
                maxLines: 2,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'OTP Code here'),
                // validator: (value) {
                //   return controller.validFields(value!);
                // },
              ),
            ],
          ),
        ],
      ),
      radius: 10.0,
      barrierDismissible: true);
}