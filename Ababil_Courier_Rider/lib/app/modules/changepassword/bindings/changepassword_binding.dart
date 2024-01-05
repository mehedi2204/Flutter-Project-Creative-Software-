import 'package:amvines_rider_new/app/modules/changepassword/providers/changepassword_provider.dart';
import 'package:get/get.dart';

import '../controllers/changepassword_controller.dart';

class ChangepasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangepasswordController>(
      () => ChangepasswordController(provider: ChangepasswordProvider()),
    );
  }
}
