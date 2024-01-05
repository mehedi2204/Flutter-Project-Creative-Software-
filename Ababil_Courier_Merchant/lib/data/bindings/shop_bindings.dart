import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/shop_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/shop_controller.dart';

class ShopBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ShopController>(ShopController(shopApi: ShopApi()));
  }
}
