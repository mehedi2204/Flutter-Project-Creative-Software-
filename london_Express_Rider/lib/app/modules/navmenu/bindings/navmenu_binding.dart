import 'package:get/get.dart';

import '../controllers/navmenu_controller.dart';

class NavmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavmenuController>(
      () => NavmenuController(),
    );
  }
}
