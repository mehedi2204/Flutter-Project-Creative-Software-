import 'package:amvines_rider_new/app/modules/delivered/today_delivered/bindings/today_delivered_bindings.dart';
import 'package:amvines_rider_new/app/modules/delivered/total_delivered/views/total_delivered_view.dart';
import 'package:amvines_rider_new/app/modules/oderDetails/bindings/order_details_binding.dart';
import 'package:amvines_rider_new/app/modules/oderDetails/views/order_details_view.dart';
import 'package:amvines_rider_new/app/modules/transferreq/bindings/orderreturn_binding.dart';
import 'package:amvines_rider_new/app/modules/transferreq/views/transfer_view.dart';
import 'package:get/get.dart';

import '../modules/changepassword/bindings/changepassword_binding.dart';
import '../modules/changepassword/views/changepassword_view.dart';
import '../modules/delivered/today_delivered/views/todaydelivered_view.dart';
import '../modules/delivered/total_delivered/bindings/total_delivered_bindings.dart';
import '../modules/deliveryreq/views/component/otpverify_view.dart';
import '../modules/pickupassign/bindings/pickupassign_binding.dart';
import '../modules/pickupassign/views/pickupassign_view.dart';
import '../modules/transferorderreport/bindings/transferorderreport_binding.dart';
import '../modules/transferorderreport/views/transferorderreport_view.dart';
import '../modules/confirmorderreport/bindings/confirmorderreport_binding.dart';
import '../modules/confirmorderreport/views/confirmorderreport_view.dart';
import '../modules/deliveryreq/bindings/deliveryreq_binding.dart';
import '../modules/deliveryreq/views/deliveryreq_view.dart';
import '../modules/deliveryreq/views/signature_pad.dart';
import '../modules/deliveryreq/views/verification.dart';
import '../modules/forgotpassword/bindings/forgotpassword_binding.dart';
import '../modules/forgotpassword/views/checkotp_view.dart';
import '../modules/forgotpassword/views/forgotpassword_view.dart';
import '../modules/forgotpassword/views/resetpassword_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/inactiveAccount/bindings/inactive_account_binding.dart';
import '../modules/inactiveAccount/views/inactive_account_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navmenu/bindings/navmenu_binding.dart';
import '../modules/navmenu/views/navmenu_view.dart';
import '../modules/orderreturn/bindings/orderreturn_binding.dart';
import '../modules/orderreturn/views/orderreturn_view.dart';
import '../modules/pickupreq/bindings/pickupreq_binding.dart';
import '../modules/pickupreq/views/pickupreq_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/returnorderreport/bindings/returnorderreport_binding.dart';
import '../modules/returnorderreport/views/returnorderreport_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.OTPVerifyRoute,
    //   page: () => const OtpVerifyView(),
    // ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.INACTIVE_ACCOUNT,
      page: () => const InactiveAccountView(),
      binding: InactiveAccountBinding(),
    ),
    GetPage(
      name: _Paths.NAVMENU,
      page: () => const NavmenuView(),
      binding: NavmenuBinding(),
    ),
    GetPage(
      name: _Paths.PICKUPREQ,
      page: () => const PickupreqView(),
      binding: PickupreqBinding(),
    ),
    GetPage(
      name: _Paths.PICKUPASSIGN,
      page: () => const PickupassignView(),
      binding: PickupassignBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERYREQ,
      page: () => const DeliveryreqView(),
      binding: DeliveryreqBinding(),
    ),
    /*GetPage(
      name: _Paths.VERIFICATIONUSER,
      page: () => const VarificationUser(),
    ),
    GetPage(
      name: _Paths.SIGNATUREPAD,
      page: () => const SignaturePad(),
    ),*/
    GetPage(
      name: _Paths.ORDERRETURN,
      page: () => const OrderreturnView(),
      binding: OrderreturnBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRMORDERREPORT,
      page: () => const ConfirmorderreportView(),
      binding: ConfirmorderreportBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFERORDERREPORT,
      page: () => const TransferorderreportView(),
      binding: TransferorderreportBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASSWORD,
      page: () => const ChangepasswordView(),
      binding: ChangepasswordBinding(),
    ),
    GetPage(
      name: _Paths.RETURNORDERREPORT,
      page: () => const ReturnorderreportView(),
      binding: ReturnorderreportBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => const ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOTP,
      page: () => const CheckOtpView(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => const ResetpasswordView(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ORDERDETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBindings(),
    ),
    GetPage(
      name: _Paths.TRANSFER,
      page: () => const TransferView(),
      binding: TransferBinding(),
    ),
    GetPage(
      name: _Paths.TODAYDELIVERED,
      page: () => const TodayDeliveredView(),
      binding: TodayDeliveredBindings(),
    ),
    GetPage(
      name: _Paths.TOTALDELIVERED,
      page: () => const TotalDeliveredView(),
      binding: TotalDeliveredBindings(),
    ),
  ];
}
