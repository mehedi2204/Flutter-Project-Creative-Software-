import 'package:amvines_rider_new/app/modules/deliveryreq/providers/deliveryreq_provider.dart';
import 'package:get/get.dart';

import '../controllers/deliveryreq_controller.dart';

class DeliveryreqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryreqController>(
      () => DeliveryreqController(provider: DeliveryreqProvider()),
    );
  }
}
