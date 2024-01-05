import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/remote/payment_api.dart';
import 'package:Ababil_Courier_Merchant/presentation/controller/payment_controller.dart';

class PaymentBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PaymentController>(PaymentController(paymentApi: PaymentApi()));
  }
}
