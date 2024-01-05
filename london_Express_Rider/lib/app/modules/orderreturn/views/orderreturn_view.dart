import 'package:amvines_rider_new/app/modules/orderreturn/views/return_ordercard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_constant.dart';
import '../../internetchecker/controllers/internetchecker_controller.dart';
import '../../internetchecker/views/internetchecker_view.dart';
import '../controllers/orderreturn_controller.dart';

class OrderreturnView extends GetView<OrderreturnController> {
  const OrderreturnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Return".tr.toString()),
        backgroundColor: AppColorsConst.dPrimaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Get.offNamed(Routes.ORDERRETURN);
          controller.getReturnOdrderList(true);
        },
        child: Obx(() =>
            Get.find<InternetcheckerController>().connectionStatus.value == 1
                ? controller.obx(
                    (response) => response == null
                        ? EmptyFailureNoInternetView(
                            image: 'assets/lottie/empty_lottie.json',
                            title: 'Not Found',
                            description: 'Data Not Found',
                            buttonText: "Retry",
                            onPressed: () {
                              controller.getReturnOdrderList(true);
                            },
                          )
                        : ListView.builder(
                            itemCount: response.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              return ReturnOrderCard(
                                  returnOrderData: response.data![index],
                                  press: () {
                                    controller.getVerifyDialog(
                                        invoiceId: response
                                            .data![index].invoiceId
                                            .toString());
                                  },
                                  isPres: true);
                            },
                          ),
                    onEmpty: EmptyFailureNoInternetView(
                      image: 'assets/lottie/empty_lottie.json',
                      title: 'Content unavailable',
                      description: 'Request Not Found',
                      buttonText: "Retry",
                      onPressed: () {
                        controller.getReturnOdrderList(true);
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
                              controller.getReturnOdrderList(true);
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
                        controller.getReturnOdrderList(true);
                      },
                    ),
                  )),
      ),
    );
  }
}
