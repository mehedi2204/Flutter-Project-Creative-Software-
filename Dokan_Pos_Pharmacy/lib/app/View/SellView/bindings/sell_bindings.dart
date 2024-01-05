
import 'package:dokan_pos/app/View/SellView/controller/sell_controller.dart';
import 'package:dokan_pos/app/View/SellView/response/sell_repository.dart';
import 'package:get/get.dart';

class SellBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellController>(
          () => SellController(sellResponse: SellResponse()),
    );
  }
}
