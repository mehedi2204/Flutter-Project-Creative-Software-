import 'package:get/get.dart';
import 'package:lbdl_merchant/data/remote/user_info_api.dart';
import 'package:lbdl_merchant/presentation/controller/incomplete_controller.dart';

class IncompleteBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IncompleteController>(
        IncompleteController(userInfoApi: UserInfoApi()));
  }
}
