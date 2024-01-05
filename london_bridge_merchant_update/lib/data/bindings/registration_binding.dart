import 'package:get/get.dart';
import 'package:lbdl_merchant/data/remote/registration_api.dart';
import 'package:lbdl_merchant/presentation/controller/registration_controller.dart';

class RegistrationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<RegistrationController>(
        RegistrationController(registrationApi: RegistrationApi()));
  }
}
