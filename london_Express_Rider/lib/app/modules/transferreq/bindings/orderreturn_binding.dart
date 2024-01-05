import 'package:amvines_rider_new/app/modules/transferreq/providers/transfer_provider.dart';
import 'package:get/get.dart';

import '../controllers/orderreturn_controller.dart';

class TransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferController>(
      () => TransferController(provider: TransferProvider()),
    );
  }
}
