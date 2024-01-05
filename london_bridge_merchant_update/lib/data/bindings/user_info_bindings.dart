import 'package:get/get.dart';
import 'package:lbdl_merchant/data/remote/user_info_api.dart';
import 'package:lbdl_merchant/presentation/controller/profile_controller.dart';

class UserInfoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PofileController>(PofileController(userInfoApi: UserInfoApi()));
  }
}
