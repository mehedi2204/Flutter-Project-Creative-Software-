import 'package:get/get.dart';
import 'package:lbdl_merchant/data/remote/order_history_api.dart';
import 'package:lbdl_merchant/data/remote/return_history_api.dart';
import 'package:lbdl_merchant/presentation/controller/order_history_controller.dart';
import 'package:lbdl_merchant/presentation/controller/return_history_controller.dart';

class ReturnHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ReturnHistoryController>(
        ReturnHistoryController(returnHistoryApi: ReturnHistoryApi()));
  }
}
