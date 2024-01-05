import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/modules/transferorderreport/views/transfer_report_card.dart';
import 'package:amvines_rider_new/app/modules/transferreq/views/transfer_order_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../internetchecker/controllers/internetchecker_controller.dart';
import '../../internetchecker/views/internetchecker_view.dart';
import '../controllers/transferorderreport_controller.dart';

class TransferorderreportView extends GetView<TransferderreportController> {
  const TransferorderreportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Transfer Order Report".tr.toString()),
        backgroundColor: AppColorsConst.dPrimaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getTransferOdrderList();
        },
        child: Column(
          children: [
            // CollectHeader(
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
                        (response) => response!.isEmpty
                            ? EmptyFailureNoInternetView(
                                image: 'assets/lottie/empty_lottie.json',
                                title: 'Not Found',
                                description: 'Data Not Found',
                                buttonText: "Retry",
                                onPressed: () {
                                  controller.getTransferOdrderList();
                                },
                              )
                            : ListView.builder(
                                itemCount: response.length,
                                itemBuilder: (BuildContext context, index) {
                                  return TransferreportCard(
                                      transferData: response[index],
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
                            controller.getTransferOdrderList();
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
                                  controller.getTransferOdrderList();
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
                            controller.getTransferOdrderList();
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
