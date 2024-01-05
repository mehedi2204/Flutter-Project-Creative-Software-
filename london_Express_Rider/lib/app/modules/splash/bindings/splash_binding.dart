import 'package:amvines_rider_new/app/modules/internetchecker/controllers/internetchecker_controller.dart';
import 'package:amvines_rider_new/app/modules/splash/providers/splash_provider.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InternetcheckerController(), permanent: true);
    // Get.lazyPut<StorageHelper>(
    //   () => StorageHelper(box: GetStorage('rider')),
    // );

    Get.lazyPut<SplashController>(
      () => SplashController(splashProvider: SplashProvider()),
    );
  }
}
