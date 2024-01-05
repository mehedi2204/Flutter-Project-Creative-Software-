import 'package:amvines_rider_new/app/modules/orderreturn/providers/orderreturn_provider.dart';
import 'package:get/get.dart';

import '../controllers/orderreturn_controller.dart';

class OrderreturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderreturnController>(
      () => OrderreturnController(provider: OrderreturnProvider()),
    );
  }
}
