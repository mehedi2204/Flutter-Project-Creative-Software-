import 'package:get/get.dart';
import 'package:lbdl_merchant/data/remote/order_api.dart';
import 'package:lbdl_merchant/presentation/controller/order_controller.dart';
import 'package:lbdl_merchant/presentation/controller/order_create_controller.dart';

class OrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderController>(OrderController(orderApi: OrderApi()));
    Get.put<OrderCreateController>(OrderCreateController(orderApi: OrderApi()),);
  }
}
