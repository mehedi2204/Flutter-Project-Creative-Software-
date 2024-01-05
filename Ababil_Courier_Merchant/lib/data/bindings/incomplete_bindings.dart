import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/user_info_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/incomplete_controller.dart';

class IncompleteBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IncompleteController>(
        IncompleteController(userInfoApi: UserInfoApi()));
  }
}
