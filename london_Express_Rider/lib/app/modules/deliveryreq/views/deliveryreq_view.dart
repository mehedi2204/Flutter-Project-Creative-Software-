import 'package:amvines_rider_new/app/modules/deliveryreq/views/component/noteanddate_exchange_dialog.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/views/deliveryreq_card.dart';
import 'package:amvines_rider_new/app/modules/deliveryreq/views/component/show_option_menu_modal.dart';
import 'package:amvines_rider_new/app/modules/internetchecker/views/internetchecker_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_constant.dart';
import '../../internetchecker/controllers/internetchecker_controller.dart';
import '../controllers/deliveryreq_controller.dart';

class DeliveryreqView extends GetView<DeliveryreqController> {
  const DeliveryreqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Requests".tr.toString()),
        backgroundColor: AppColorsConst.dPrimaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          //Get.offNamed(Routes.DELIVERYREQ);
          controller.getDeliveryreqlist(true);
        },
        child: Obx(() =>
            Get.find<InternetcheckerController>().connectionStatus.value == 1
                ? controller.obx(
                    (deliveryReqList) => deliveryReqList!.isEmpty
                        ? EmptyFailureNoInternetView(
                            image: 'assets/lottie/empty_lottie.json',
                            title: 'Not Found',
                            description: 'Request Not Found',
                            buttonText: "Retry",
                            onPressed: () {
                              controller.getDeliveryreqlist(true);
                            },
                          )
                        : ListView.builder(
                            itemCount: deliveryReqList.length,
                            itemBuilder: (BuildContext context, index) {
                              return DeliveryReqCard(
                                deliveryRequest: deliveryReqList[index],
                                option: () {
                                  showOptionMenuModal(
                                      context,
                                      controller,
                                      deliveryReqList[index]
                                          .trackingId
                                          .toString());
                                },
                                exchange: () {
                                  getExchaneDialog(
                                      trkid: deliveryReqList[index]
                                          .trackingId
                                          .toString(),
                                      controller: controller);
                                },
                                delivered: () {
                                  controller.getDelivered(
                                      trkId: deliveryReqList[index].trackingId);
                                },
                              );
                            },
                          ),
                    onEmpty: EmptyFailureNoInternetView(
                      image: 'assets/lottie/empty_lottie.json',
                      title: 'Content unavailable',
                      description: 'Request Not Found',
                      buttonText: "Retry",
                      onPressed: () {
                        controller.getDeliveryreqlist(true);
                      },
                    ),
                    onLoading: Center(
                      child: Lottie.asset(
                        'assets/lottie/loading.json',
                        height: 250,
                        width: 250,
                      ),
                    ),
                    onError: (error) => SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: EmptyFailureNoInternetView(
                            image: 'assets/lottie/failure_lottie.json',
                            title: 'Error',
                            description: error.toString(),
                            buttonText: "Retry",
                            onPressed: () {
                              controller.getDeliveryreqlist(true);
                            },
                          ),
                        ))
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: EmptyFailureNoInternetView(
                      image: 'assets/lottie/no_internet_lottie.json',
                      title: 'Network Error',
                      description: 'Internet not found !!',
                      buttonText: "Retry",
                      onPressed: () {
                        controller.getDeliveryreqlist(true);
                      },
                    ),
                  )),
      ),
    );
  }
}
