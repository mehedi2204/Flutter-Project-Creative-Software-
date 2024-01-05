import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/registration_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/registration_controller.dart';

class RegistrationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<RegistrationController>(
        RegistrationController(registrationApi: RegistrationApi()));
  }
}
