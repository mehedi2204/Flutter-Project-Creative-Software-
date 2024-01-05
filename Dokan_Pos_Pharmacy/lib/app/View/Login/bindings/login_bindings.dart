

import 'package:dokan_pos/app/View/Login/response/login_response.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<LoginController>(
          () => LoginController(loginResponse: LoginResponse()),
    );
  }
}
