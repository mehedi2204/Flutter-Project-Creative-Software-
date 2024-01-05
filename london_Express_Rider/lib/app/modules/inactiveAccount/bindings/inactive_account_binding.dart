import 'package:get/get.dart';

import '../controllers/inactive_account_controller.dart';

class InactiveAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InactiveAccountController>(
      () => InactiveAccountController(),
    );
  }
}
