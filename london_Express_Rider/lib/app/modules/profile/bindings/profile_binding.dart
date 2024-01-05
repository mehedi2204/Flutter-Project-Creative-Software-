import 'package:amvines_rider_new/app/modules/profile/providers/profile_provider.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(provider: ProfileProvider()),
    );
  }
}
