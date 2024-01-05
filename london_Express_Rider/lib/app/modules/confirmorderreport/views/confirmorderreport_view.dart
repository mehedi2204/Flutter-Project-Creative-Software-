import 'package:amvines_rider_new/app/gb_widgets/ordercard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_constant.dart';
import '../../internetchecker/controllers/internetchecker_controller.dart';
import '../../internetchecker/views/internetchecker_view.dart';
import '../controllers/confirmorderreport_controller.dart';

class ConfirmorderreportView extends GetView<ConfirmorderreportController> {
  const ConfirmorderreportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsConst.dPrimaryColor,
        elevation: 0,
        title: Text("Confirm Order Report".tr.toString()),
        // actions: [
        //   InkWell(
        //     onTap: () {
        //       controller.getShow();
        //     },
        //     child: const Icon(
        //       Icons.filter_list,
        //       color: AppColorsConst.mBandColor,
        //       size: 34,
        //     ),
        //   ),
        //   const SizedBox(
        //     width: 20,
        //   )
        // ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getConfirmOrderList();
        },
        child: Column(
          children: [
            // ConfirmHeader(
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
                        /*(confirmorderList) => confirmorderList!.order!.isEmpty*/
                            ? EmptyFailureNoInternetView(
                                image: 'assets/lottie/empty_lottie.json',
                                title: 'Not Found',
                                description: 'Data Not Found',
                                buttonText: "Filter",
                                onPressed: () {
                                  controller.getConfirmOrderList();
                                },
                              )
                            : ListView.builder(
                                itemCount: response.order!.length,
                                itemBuilder: (BuildContext context, index) {
                                  return OrderCard(
                                      confirmOrderReportData:
                                          response.order![index],
                                      press: () {},
                                      isPres: false);
                                },
                              ),
                        onEmpty: EmptyFailureNoInternetView(
                          image: 'assets/lottie/empty_lottie.json',
                          title: 'Content unavailable',
                          description: 'Data Not Found',
                          buttonText: "Filter",
                          onPressed: () {
                            controller.getConfirmOrderList();
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
                                buttonText: "Filter",
                                onPressed: () {
                                  controller.getConfirmOrderList();
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
                          buttonText: "Filter",
                          onPressed: () {
                            controller.getConfirmOrderList();
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
