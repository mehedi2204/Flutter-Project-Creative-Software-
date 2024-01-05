import 'package:get/get.dart';
import '../controllers/pickupassign_controller.dart';
import '../providers/pickupassign_provider.dart';

class PickupassignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickupassignController>(
      () => PickupassignController(provider: PickupassignProvider()),
    );
  }
}
