import 'package:get/get.dart';
import 'package:lbdl_merchant/data/remote/shop_api.dart';
import 'package:lbdl_merchant/presentation/controller/shop_controller.dart';

class ShopBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ShopController>(ShopController(shopApi: ShopApi()));
  }
}
