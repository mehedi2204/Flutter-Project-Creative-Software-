import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/user_info_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/profile_controller.dart';

class UserInfoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PofileController>(PofileController(userInfoApi: UserInfoApi()));
  }
}
