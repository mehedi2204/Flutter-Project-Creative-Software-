import 'package:get/get.dart';

import '../controllers/total_delivered_controller.dart';
import '../providers/total_delivered_provider.dart';

class TotalDeliveredBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TotalDeliveredController>(
          () => TotalDeliveredController(provider: TotalDeliveredProvider()),
    );
  }
}
