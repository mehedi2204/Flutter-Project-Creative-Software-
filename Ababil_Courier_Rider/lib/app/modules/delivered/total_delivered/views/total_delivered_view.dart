import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../const/app_constant.dart';
import '../../../internetchecker/controllers/internetchecker_controller.dart';
import '../../../internetchecker/views/internetchecker_view.dart';
import '../controllers/total_delivered_controller.dart';
import 'total_delivered_card.dart';


class TotalDeliveredView extends GetView<TotalDeliveredController> {
  const TotalDeliveredView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monthly Delivery Report".tr.toString()),
        backgroundColor: AppColorsConst.dPrimaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Get.offNamed(Routes.ORDERRETURN);
          controller.getTodayDeliveredList();
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
                              controller.getTodayDeliveredList();
                            },
                          )
                        : ListView.builder(
                            itemCount: response.length,
                            itemBuilder: (BuildContext context, index) {
                              print('this is length'+response.length.toString());
                              return TotalDeliveredCard(
                                  totalDeliveredData: response[index],
                                  isPres: true);
                            },
                          ),
                    onEmpty: EmptyFailureNoInternetView(
                      image: 'assets/lottie/empty_lottie.json',
                      title: 'Content unavailable',
                      description: 'Request Not Found',
                      buttonText: "Retry",
                      onPressed: () {
                        controller.getTodayDeliveredList();
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
                              controller.getTodayDeliveredList();
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
                        controller.getTodayDeliveredList();
                      },
                    ),
                  )),
      ),
    );
  }
}
