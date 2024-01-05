/*
import 'dart:io';

import 'package:amvines_rider_new/app/gb_widgets/button.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/controllers/deliveryreq_controller.dart';
import 'package:amvines_rider_new/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_constant.dart';
import '../../../const/size_config.dart';

class VarificationUser extends GetView<DeliveryreqController> {
  const VarificationUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.signatureController.clear();
        controller.sig = null;
        controller.image!.value = File('10');
        controller.signature!.value = File('10');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("User Verify".tr.toString()),
          backgroundColor: AppColorsConst.dPrimaryColor,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              Obx(
                () => Container(
                  height: SizeConfig.screenHight! * 0.40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      gradient: AppColorsConst.dPrimaryGradientColor),
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.antiAlias,
                    children: [
                      if (Get.find<DeliveryreqController>().image!.value.path ==
                          '10')
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Lottie.asset('assets/lottie/photo.json'),
                          ),
                        ),
                      if (Get.find<DeliveryreqController>().image!.value.path !=
                          '10')
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Image.file(
                              Get.find<DeliveryreqController>().image!.value,
                              fit: BoxFit.fill,
                              height: SizeConfig.screenHight! * 0.40,
                              width: SizeConfig.screenWidth!,
                            ),
                          ),
                        ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              Get.find<DeliveryreqController>().getImage();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.deepOrange),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<DeliveryreqController>(
                builder: (controller) {
                  return Container(
                    height: SizeConfig.screenHight! * 0.40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        gradient: AppColorsConst.dPrimaryGradientColor),
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.antiAlias,
                      children: [
                        if (Get.find<DeliveryreqController>()
                                .signature!
                                .value
                                .path ==
                            '10')
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Lottie.asset('assets/lottie/signature.json'),
                          ),
                        if (Get.find<DeliveryreqController>()
                                .signature!
                                .value
                                .path !=
                            '10')
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Image.file(
                                controller.signature!.value,
                                fit: BoxFit.fill,
                                height: SizeConfig.screenHight! * 0.40,
                                width: SizeConfig.screenWidth!,
                              ),
                            ),
                          ),
                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.SIGNATUREPAD);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.deepOrange),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButtton(
                press: () {
                  Get.find<DeliveryreqController>().getcheckValidation();
                },
                title: 'Confirm Order',
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
