import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lbdl_merchant/presentation/controller/internetchecker_controller.dart';
import 'package:lbdl_merchant/presentation/controller/order_history_controller.dart';
import 'package:lbdl_merchant/presentation/no_internet/internetchecker_view.dart';
import 'package:lbdl_merchant/presentation/screens/Order_History/components/order_history_header.dart';
import 'package:lbdl_merchant/presentation/screens/gb_widgets/data_loader.dart';
import 'package:lbdl_merchant/presentation/screens/order/component/order_card.dart';
import 'package:lbdl_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:lbdl_merchant/presentation/screens/resources/string_manager.dart';
import 'package:lbdl_merchant/presentation/screens/resources/values_manager.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const OrderHistoryHeader(),
            const SizedBox(
              height: AppSize.s10,
            ),
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                await controller.getConfirmOrders();
              },
              child: Obx(
                () => Get.find<InternetcheckerController>()
                            .connectionStatus
                            .value ==
                        1
                    ? controller.obx(
                        (response) => response!.isEmpty
                            ? EmptyFailureNoInternetView(
                                image: ImageAssets.noData,
                                title: AppStrings.noData,
                                description: AppStrings.noDataMsg,
                                buttonText: AppStrings.retry,
                                onPressed: () {
                                  controller.getConfirmOrders();
                                },
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) => OrderCard(
                                  order: response[index],
                                ),
                                itemCount: response.length,
                              ),
                        onEmpty: EmptyFailureNoInternetView(
                          image: ImageAssets.noData,
                          title: AppStrings.noData,
                          description: AppStrings.noDataMsg,
                          buttonText: AppStrings.retry,
                          onPressed: () {
                            controller.getConfirmOrders();
                          },
                        ),
                        onLoading: const DataLoader(),
                        onError: (error) => SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: EmptyFailureNoInternetView(
                            image: ImageAssets.noData,
                            title: AppStrings.error,
                            description: error.toString(),
                            buttonText: AppStrings.retry,
                            onPressed: () {
                              controller.getConfirmOrders();
                            },
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: EmptyFailureNoInternetView(
                          image: ImageAssets.noInternet,
                          title: AppStrings.noInternet,
                          description: AppStrings.checkConnection,
                          buttonText: AppStrings.retry,
                          onPressed: () {
                            controller.getConfirmOrders();
                          },
                        ),
                      ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
