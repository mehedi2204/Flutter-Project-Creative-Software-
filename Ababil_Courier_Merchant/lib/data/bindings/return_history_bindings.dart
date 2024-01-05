import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/order_history_api.dart';
import 'package:Ababil_Courier_Merchant/data/remote/return_history_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/order_history_controller.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/return_history_controller.dart';

class ReturnHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ReturnHistoryController>(
        ReturnHistoryController(returnHistoryApi: ReturnHistoryApi()));
  }
}
