import 'package:amvines_rider_new/app/modules/oderDetails/providers/orderreturn_provider.dart';
import 'package:get/get.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(
      () => OrderDetailsController(provider: OrderDetailsProvider()),
    );
  }
}
