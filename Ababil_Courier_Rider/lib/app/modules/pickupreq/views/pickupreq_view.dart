import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/gb_widgets/list_card.dart';
import 'package:amvines_rider_new/app/modules/internetchecker/controllers/internetchecker_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../internetchecker/views/internetchecker_view.dart';
import '../controllers/pickupreq_controller.dart';

class PickupreqView extends GetView<PickupreqController> {
  const PickupreqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Up Request".tr.toString()),
        backgroundColor: AppColorsConst.dPrimaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          //Get.offNamed(Routes.PICKUPREQ);
          controller.getpickupreqlist(true);
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
                              controller.getpickupreqlist(true);
                            },
                          )
                        : ListView.builder(
                            itemCount: pickupreqlist.length,
                            itemBuilder: (BuildContext context, index) {
                              return ListCard(
                                pickupRequest: pickupreqlist[index],
                                accept: () {
                                  controller.getOrderCollect(
                                      trkId: pickupreqlist[index].trackingId);
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
                        controller.getpickupreqlist(true);
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
                              controller.getpickupreqlist(true);
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
                        controller.getpickupreqlist(true);
                      },
                    ),
                  )),
      ),
    );
  }
}
