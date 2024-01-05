import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/payment_history_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/payment_history_controller.dart';

class PaymentHistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PaymentHistoryController>(
        PaymentHistoryController(paymentHistoryApi: PaymentHistoryApi()));
  }
}
