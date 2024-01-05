import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/dashboard_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
        DashboardController(dashboardApi: DashboardApi()),
        permanent: true);
  }
}
