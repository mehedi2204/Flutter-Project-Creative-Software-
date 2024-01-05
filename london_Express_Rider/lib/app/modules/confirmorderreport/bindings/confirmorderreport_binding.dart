import 'package:amvines_rider_new/app/modules/confirmorderreport/providers/confirmorderreport_provider.dart';
import 'package:get/get.dart';

import '../controllers/confirmorderreport_controller.dart';

class ConfirmorderreportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmorderreportController>(
      () => ConfirmorderreportController(provider: ConfirmorderreportProvider()),
    );
  }
}
