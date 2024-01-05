import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/gb_widgets/button_widgets.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/controllers/deliveryreq_controller.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/controllers/otpController.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/views/component/noteanddate_option_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

showOptionMenuModal(

    BuildContext context, DeliveryreqController controller, String trackingId) {
  //final controller = Get.put(OtpController(), permanent: false);
  Get.bottomSheet(Container(
    padding: const EdgeInsets.only(top: 5),

    height: MediaQuery.of(context).size.height * .75,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 6,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
        ),
        ButtonWidgets(
          label: 'Rescheduled Order'.tr,
          height: 45,
          width: 300,
          press: () {
            getOptionsDialog(
                trkid: trackingId, type: 'schedule', controller: controller);
          },
          clr: Colors.deepOrange,
          isClose: false,
        ),
        ButtonWidgets(
          label: 'Hold Order'.tr,
          height: 45,
          width: 300,
          press: () {
            getOptionsDialog(
                trkid: trackingId, type: 'hold', controller: controller);
          },
          clr: AppColorsConst.dPrimaryColor,
          isClose: false,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonWidgets(
              label: 'Return Request'.tr,
              height: 45,
              width: 150,
              tr: 0,
              br: 0,
              press: () {/*print(trackingId);*/
                controller.sendOtp(
                  trkId: trackingId,
                );
                /*getOptionsDialog(
                trkid: trackingId, type: 'return', controller: controller);*/
              },
              clr: Colors.teal,
              isClose: false,
            ),
            ButtonWidgets(
              label: 'OTP Verify'.tr,
              height: 45,
              width: 150,
              tl: 0,
              bl: 0,
              press: () {
                getOtopDialog(
                    trkid: trackingId, type: 'return', controller: controller);
                /*getOptionsDialog(
                trkid: trackingId, type: 'return', controller: controller);*/
              },
              clr: AppColorsConst.mBackgroundColor2,
              isClose: false,
            ),
          ],
        ),
        ButtonWidgets(
            label: 'Close'.tr,
            height: 30,
            width: 300,
            press: () {
              Get.back();
            },
            clr: Colors.red[300]!,
            isClose: true),
      ],
    ),
  ));
}
