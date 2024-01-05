import 'package:amvines_rider_new/app/gb_widgets/ordercard.dart';
import 'package:amvines_rider_new/app/modules/oderDetails/controllers/order_details_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_constant.dart';
import '../../internetchecker/controllers/internetchecker_controller.dart';
import '../../internetchecker/views/internetchecker_view.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details".tr.toString()),
        backgroundColor: AppColorsConst.dPrimaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getReturnOdrderList(
              invoiceId: controller.invoiceId!);
        },
        child: Obx(() =>
            Get.find<InternetcheckerController>().connectionStatus.value == 1
                ? controller.obx(
                    (list) => list!.isEmpty
                        ? EmptyFailureNoInternetView(
                            image: 'assets/lottie/empty_lottie.json',
                            title: 'Not Found',
                            description: 'Data Not Found',
                            buttonText: "Retry",
                            onPressed: () {
                              controller.getReturnOdrderList(
                                  invoiceId: controller.invoiceId.toString());
                            },
                          )
                        : ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (BuildContext context, index) {
                              return OrderCard(
                                  confirmOrderReportData: list[index],
                                  press: () {},
                                  isPres: true);
                            },
                          ),
                    onEmpty: EmptyFailureNoInternetView(
                      image: 'assets/lottie/empty_lottie.json',
                      title: 'Content unavailable',
                      description: 'Request Not Found',
                      buttonText: "Retry",
                      onPressed: () {
                        controller.getReturnOdrderList(
                            invoiceId: controller.invoiceId!);
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
                              controller.getReturnOdrderList(
                                  invoiceId: controller.invoiceId!);
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
                        controller.getReturnOdrderList(
                            invoiceId: controller.invoiceId!);
                      },
                    ),
                  )),
      ),
    );
  }
}
