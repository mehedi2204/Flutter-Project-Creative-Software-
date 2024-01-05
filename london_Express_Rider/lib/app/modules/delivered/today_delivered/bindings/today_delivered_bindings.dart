import 'package:get/get.dart';

import '../controllers/todaydelivered_controller.dart';
import '../providers/todaydelivered_provider.dart';

class TodayDeliveredBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodayDeliveredController>(
          () => TodayDeliveredController(provider: TodayDeliveredProvider()),
    );
  }
}
