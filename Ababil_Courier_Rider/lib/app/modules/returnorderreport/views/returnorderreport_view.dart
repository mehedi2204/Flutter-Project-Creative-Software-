import 'package:amvines_rider_new/app/modules/returnorderreport/views/return_report_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_constant.dart';
import '../../internetchecker/controllers/internetchecker_controller.dart';
import '../../internetchecker/views/internetchecker_view.dart';
import '../controllers/returnorderreport_controller.dart';

class ReturnorderreportView extends GetView<ReturnorderreportController> {
  const ReturnorderreportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsConst.dPrimaryColor,
        elevation: 0,
        title: Text("Return Order Report".tr.toString()),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getReturnOrderList();
        },
        child: Column(
          children: [
            // ReturnHeader(
            //   controller: controller,
            // ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => Get.find<InternetcheckerController>()
                            .connectionStatus
                            .value ==
                        1
                    ? controller.obx(
                        (response) => response == null
                            ? EmptyFailureNoInternetView(
                                image: 'assets/lottie/empty_lottie.json',
                                title: 'Not Found',
                                description: 'Data Not Found',
                                buttonText: "Retry",
                                onPressed: () {
                                  controller.getReturnOrderList();
                                },
                              )
                            : ListView.builder(
                                itemCount: response.data!.length,
                                itemBuilder: (BuildContext context, index) {
                                  return ReturnOrderReportCard(
                                      returnOrderData: response.data![index],
                                      press: () {},
                                      isPres: true);
                                },
                              ),
                        onEmpty: EmptyFailureNoInternetView(
                          image: 'assets/lottie/empty_lottie.json',
                          title: 'Content unavailable',
                          description: 'Data Not Found',
                          buttonText: "Retry",
                          onPressed: () {
                            controller.getReturnOrderList();
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
                                  controller.getReturnOrderList();
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
                            controller.getReturnOrderList();
                          },
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
