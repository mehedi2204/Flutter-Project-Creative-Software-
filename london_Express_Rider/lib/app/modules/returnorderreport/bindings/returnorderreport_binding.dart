import 'package:amvines_rider_new/app/modules/returnorderreport/providers/returnorderreport_provider.dart';
import 'package:get/get.dart';

import '../controllers/returnorderreport_controller.dart';

class ReturnorderreportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReturnorderreportController>(
      () => ReturnorderreportController(provider: ReturnorderreportProvider()),
    );
  }
}
