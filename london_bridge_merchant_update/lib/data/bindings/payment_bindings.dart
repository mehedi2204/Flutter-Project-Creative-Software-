import 'package:get/get.dart';
import 'package:lbdl_merchant/data/remote/payment_api.dart';
import 'package:lbdl_merchant/presentation/controller/payment_controller.dart';

class PaymentBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<PaymentController>(PaymentController(paymentApi: PaymentApi()));
  }
}
