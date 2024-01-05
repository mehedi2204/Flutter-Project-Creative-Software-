import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/order_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/order_controller.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/order_create_controller.dart';

class OrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderController>(OrderController(orderApi: OrderApi()));
    Get.put<OrderCreateController>(OrderCreateController(orderApi: OrderApi()),);
  }
}
