import 'package:get/get.dart';
import 'package:lbdl_merchant/data/remote/order_api.dart';
import 'package:lbdl_merchant/presentation/controller/user_info_controller.dart';

import '../../presentation/controller/internetchecker_controller.dart';
import '../../presentation/controller/order_create_controller.dart';

class RootBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<UserInfoController>(UserInfoController());
    Get.put<InternetcheckerController>(InternetcheckerController(),
        permanent: true);
    
  }
}
