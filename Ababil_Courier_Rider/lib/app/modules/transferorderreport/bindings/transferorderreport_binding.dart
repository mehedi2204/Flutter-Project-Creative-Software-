import 'package:amvines_rider_new/app/modules/transferorderreport/providers/transferorderreport_provider.dart';
import 'package:get/get.dart';

import '../controllers/transferorderreport_controller.dart';

class TransferorderreportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferderreportController>(
      () =>
          TransferderreportController(provider: TransferderreportProvider()),
    );
  }
}
