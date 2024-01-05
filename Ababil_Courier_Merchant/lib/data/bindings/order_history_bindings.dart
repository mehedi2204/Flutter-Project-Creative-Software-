import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/order_history_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/order_history_controller.dart';

class OrderHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderHistoryController>(
        OrderHistoryController(orderHistoryApi: OrderHistoryApi()));
  }
}
