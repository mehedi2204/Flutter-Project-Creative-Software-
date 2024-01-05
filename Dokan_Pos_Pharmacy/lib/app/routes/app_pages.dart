import 'package:dokan_pos/app/View/Home/home.dart';
import 'package:dokan_pos/app/View/SellView/sell_view.dart';
import 'package:dokan_pos/app/View/settings/settings-view.dart';
import 'package:get/get.dart';

//import '../View/Home/HomeView.dart';
import '../View/Login/bindings/login_bindings.dart';
import '../View/Login/view/login_view.dart';
import '../View/SellView/bindings/sell_bindings.dart';
import '../View/Splash/splash_view.dart';
import '../constraints/storage_healper.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const MyHomePage(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SELL,
      page: () => SellView(),
      binding: SellBindings(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      //binding: SellBindings(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => StorageHelper.readString(key: "token") == null? SplashView(): MyHomePage(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: _Paths.INACTIVE_ACCOUNT,
    //   page: () => const InactiveAccountView(),
    //   binding: InactiveAccountBinding(),
    // ),
    // GetPage(
    //   name: _Paths.NAVMENU,
    //   page: () => const NavmenuView(),
    //   binding: NavmenuBinding(),
    // ),
    // GetPage(
    //   name: _Paths.PICKUPREQ,
    //   page: () => const PickupreqView(),
    //   binding: PickupreqBinding(),
    // ),
    // GetPage(
    //   name: _Paths.DELIVERYREQ,
    //   page: () => const DeliveryreqView(),
    //   binding: DeliveryreqBinding(),
    // ),
    // /*GetPage(
    //   name: _Paths.VERIFICATIONUSER,
    //   page: () => const VarificationUser(),
    // ),
    // GetPage(
    //   name: _Paths.SIGNATUREPAD,
    //   page: () => const SignaturePad(),
    // ),*/
    // GetPage(
    //   name: _Paths.ORDERRETURN,
    //   page: () => const OrderreturnView(),
    //   binding: OrderreturnBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CONFIRMORDERREPORT,
    //   page: () => const ConfirmorderreportView(),
    //   binding: ConfirmorderreportBinding(),
    // ),
    // GetPage(
    //   name: _Paths.TRANSFERORDERREPORT,
    //   page: () => const TransferorderreportView(),
    //   binding: TransferorderreportBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CHANGEPASSWORD,
    //   page: () => const ChangepasswordView(),
    //   binding: ChangepasswordBinding(),
    // ),
    // GetPage(
    //   name: _Paths.RETURNORDERREPORT,
    //   page: () => const ReturnorderreportView(),
    //   binding: ReturnorderreportBinding(),
    // ),
    // GetPage(
    //   name: _Paths.FORGOTPASSWORD,
    //   page: () => const ForgotpasswordView(),
    //   binding: ForgotpasswordBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CHECKOTP,
    //   page: () => const CheckOtpView(),
    // ),
    // GetPage(
    //   name: _Paths.RESETPASSWORD,
    //   page: () => const ResetpasswordView(),
    // ),
    // GetPage(
    //   name: _Paths.SIGNUP,
    //   page: () => const SignupView(),
    //   binding: SignupBinding(),
    // ),
    // GetPage(
    //   name: _Paths.PROFILE,
    //   page: () => const ProfileView(),
    //   binding: ProfileBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ORDERDETAILS,
    //   page: () => const OrderDetailsView(),
    //   binding: OrderDetailsBindings(),
    // ),
    // GetPage(
    //   name: _Paths.TRANSFER,
    //   page: () => const TransferView(),
    //   binding: TransferBinding(),
    // ),
    // GetPage(
    //   name: _Paths.TODAYDELIVERED,
    //   page: () => const TodayDeliveredView(),
    //   binding: TodayDeliveredBindings(),
    // ),
    // GetPage(
    //   name: _Paths.TOTALDELIVERED,
    //   page: () => const TotalDeliveredView(),
    //   binding: TotalDeliveredBindings(),
    // ),
  ];
}
