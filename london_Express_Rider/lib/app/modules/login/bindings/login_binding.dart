import 'package:amvines_rider_new/app/modules/login/providers/login_provider.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
   
    Get.lazyPut<LoginController>(
      () => LoginController(loginProvider: LoginProvider()),
    );
  }
}
