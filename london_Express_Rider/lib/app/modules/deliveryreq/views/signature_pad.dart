/*
import 'package:amvines_rider_new/app/const/size_config.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/controllers/deliveryreq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../../const/app_constant.dart';

class SignaturePad extends StatelessWidget {
  const SignaturePad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Signature".tr.toString()),
        backgroundColor: AppColorsConst.dPrimaryColor,
        actions: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () async {
                    // exportedImage = await controller.toPngBytes();
                    // //API
                    // setState(() {});
                    Get.find<DeliveryreqController>().takeSignature();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              side: const BorderSide(color: Colors.red)))),
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 14),
                  ))),
          Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                  onPressed: () {
                    // controller.clear();
                    Get.find<DeliveryreqController>()
                        .signatureController
                        .clear();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0)))),
                  child: const Text(
                    "Clear",
                    style: TextStyle(fontSize: 14),
                  ))),
          const SizedBox(width: 10),
        ],
      ),
      body: SizedBox(
        child: Signature(
          controller: Get.find<DeliveryreqController>().signatureController,
          backgroundColor: Colors.white,
          height: SizeConfig.screenHight,
          width: SizeConfig.screenWidth,
        ),
      ),
    );
  }
}
*/
