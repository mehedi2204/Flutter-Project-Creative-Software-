import 'package:get/get.dart';
import 'package:lbdl_merchant/data/remote/dashboard_api.dart';
import 'package:lbdl_merchant/presentation/controller/dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
        DashboardController(dashboardApi: DashboardApi()),
        permanent: true);
  }
}
