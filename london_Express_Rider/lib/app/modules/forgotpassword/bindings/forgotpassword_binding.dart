import 'package:amvines_rider_new/app/modules/forgotpassword/providers/forgotpassword_provider.dart';
import 'package:get/get.dart';

import '../controllers/forgotpassword_controller.dart';

class ForgotpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotpasswordController(provider: ForgotpasswordProvider()),
        permanent: true);
  }
}
