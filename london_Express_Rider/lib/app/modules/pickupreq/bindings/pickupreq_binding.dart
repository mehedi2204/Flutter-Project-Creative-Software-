import 'package:amvines_rider_new/app/modules/pickupreq/providers/pickupreq_provider.dart';
import 'package:get/get.dart';

import '../controllers/pickupreq_controller.dart';

class PickupreqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickupreqController>(
      () => PickupreqController(provider: PickupreqProvider()),
    );
  }
}
