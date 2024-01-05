import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/gb_widgets/list_card.dart';
import 'package:amvines_rider_new/app/modules/internetchecker/controllers/internetchecker_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../gb_widgets/pickupList_card.dart';
import '../../internetchecker/views/internetchecker_view.dart';
import '../controllers/pickupassign_controller.dart';

class PickupassignView extends GetView<PickupassignController> {
  const PickupassignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Up Assign".tr.toString()),
        backgroundColor: AppColorsConst.dPrimaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          //Get.offNamed(Routes.PICKUPREQ);
          controller.getpickupassignlist();
        },
        child: Obx(() =>
            Get.find<InternetcheckerController>().connectionStatus.value == 1
                ? controller.obx(
                    (pickupreqlist) => pickupreqlist!.isEmpty
                        ? EmptyFailureNoInternetView(
                            image: 'assets/lottie/empty_lottie.json',
                            title: 'Not Found',
                            description: 'Request Not Found',
                            buttonText: "Retry",
                            onPressed: () {
                              controller.getpickupassignlist();
                            },
                          )
                        : ListView.builder(
                            itemCount: pickupreqlist.length,
                            itemBuilder: (BuildContext context, index) {
                              return PickupListCard(
                                pickupAssign: pickupreqlist[index],
                                accept: () {
                                  controller.getOrderAssign(
                                      trkId: pickupreqlist[index].trackingId.toString());
                                  // print( pickupreqlist[index].trackingId.toString());
                                },
                                cancel: () {
                                  controller.getOrderCancel(
                                      trkId: pickupreqlist[index].trackingId);
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
                        controller.getpickupassignlist();
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
                              controller.getpickupassignlist();
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
                        controller.getpickupassignlist();
                      },
                    ),
                  )),
      ),
    );
  }
}
