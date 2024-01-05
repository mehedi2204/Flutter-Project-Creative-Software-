import 'package:get/get.dart';

import '../controllers/signup_controller.dart';
import '../providers/signup_provider.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(SignupController(provider: SignupProvider()),
    //     permanent: true);
    Get.lazyPut<SignupController>(
      () => SignupController(provider: SignupProvider()),
    );
  }
}
