import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/modules/internetchecker/controllers/internetchecker_controller.dart';
import 'package:amvines_rider_new/app/modules/internetchecker/views/internetchecker_view.dart';
import 'package:amvines_rider_new/app/modules/navmenu/views/navmenu_view.dart';
import 'package:amvines_rider_new/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../gb_widgets/home_Card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsConst.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorsConst.dPrimaryColor,
        title: Text(
          "Ababil Courier Rider".tr.toString(),
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      drawer: const NavmenuView(),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.offAllNamed(Routes.HOME);
        },
        child: Obx(
          () => Get.find<InternetcheckerController>().connectionStatus.value ==
                  1
              ? controller.obx(
                  (dashboard) => Column(
                        children: [
                          //Text(state!.collect.toString()),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10, top: 5),
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  children: <Widget>[
                                    //SizedBox(height: 10,),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.PICKUPREQ);
                                      },
                                      child: RiderHomeCard(
                                        level: 'Today',
                                        countNumber:
                                            dashboard!.todayPickup.toString(),
                                        title: "PickUp Request",
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.DELIVERYREQ);
                                      },
                                      child: RiderHomeCard(
                                        level: 'Today',
                                        countNumber:
                                            dashboard.todayDelivery.toString(),
                                        title: "Delivery Request",
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.ORDERRETURN);
                                      },
                                      child: RiderHomeCard(
                                        level: 'Today',
                                        countNumber:
                                            dashboard.todayReturn.toString(),
                                        title: "Return Request",
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.TRANSFER);
                                      },
                                      child: RiderHomeCard(
                                        level: 'Today',
                                        countNumber:
                                            dashboard.todayTransfer.toString(),
                                        title: "Transfer Request",
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.TODAYDELIVERED);
                                      },
                                      child: RiderHomeCard(
                                        level: 'Today',
                                        countNumber:
                                            dashboard.todayDelivered.toString(),
                                        title: "Delivered",
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.TOTALDELIVERED);
                                      },
                                      child: RiderHomeCard(
                                        level: 'Monthly',
                                        countNumber: dashboard.monthlyDelivered
                                            .toString(),
                                        title: "Delivered",
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {},
                                      child: RiderHomeCard(
                                        level: 'Total',
                                        countNumber:
                                            dashboard.totalPickup.toString(),
                                        title: "PickUp Request",
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //Get.toNamed(Routes.DELIVERYREQ);
                                      },
                                      child: RiderHomeCard(
                                        level: 'Total',
                                        countNumber:
                                            dashboard.totalDelivery.toString(),
                                        title: "Delivery Request",
                                      ),
                                    ),
                                    RiderHomeCard(
                                      level: 'Total',
                                      countNumber:
                                          dashboard.totalReturn.toString(),
                                      title: "Return Request",
                                    ),
                                    RiderHomeCard(
                                      level: 'Total',
                                      countNumber:
                                          dashboard.totalTransfer.toString(),
                                      title: "Transfer Request",
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                  onError: (error) => SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: EmptyFailureNoInternetView(
                          ishome: true,
                          image: 'assets/lottie/failure_lottie.json',
                          title: 'Error',
                          description: error.toString(),
                          buttonText: "Retry",
                          onPressed: () {
                            controller.getDashBoardData();
                          },
                        ),
                      ),
                  onLoading: Center(
                    child: Lottie.asset(
                      'assets/lottie/loading.json',
                      height: 250,
                      width: 250,
                    ),
                  ),
                  onEmpty: EmptyFailureNoInternetView(
                    ishome: true,
                    image: 'assets/lottie/empty_lottie.json',
                    title: 'Content unavailable',
                    description: 'Content not found',
                    buttonText: "Retry",
                    onPressed: () {
                      controller.getDashBoardData();
                    },
                  ))
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: EmptyFailureNoInternetView(
                    ishome: true,
                    image: 'assets/lottie/no_internet_lottie.json',
                    title: 'Network Error',
                    description: 'Internet not found !!',
                    buttonText: "Retry",
                    onPressed: () {
                      controller.getDashBoardData();
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
