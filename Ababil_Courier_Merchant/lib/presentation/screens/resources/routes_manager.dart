import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:Ababil_Courier_Merchant/data/bindings/incomplete_bindings.dart';
import 'package:Ababil_Courier_Merchant/data/bindings/order_bindings.dart';
import 'package:Ababil_Courier_Merchant/data/bindings/order_history_bindings.dart';
import 'package:Ababil_Courier_Merchant/data/bindings/payment_bindings.dart';
import 'package:Ababil_Courier_Merchant/data/bindings/payment_history_bindings.dart';
import 'package:Ababil_Courier_Merchant/data/bindings/registration_binding.dart';
import 'package:Ababil_Courier_Merchant/data/bindings/return_history_bindings.dart';
import 'package:Ababil_Courier_Merchant/data/bindings/shop_bindings.dart';
import 'package:Ababil_Courier_Merchant/data/bindings/user_info_bindings.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/Executive/executive.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/Order_History/order_history.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/home/home.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/incative/inactive.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/incomplete/incomplete.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/login/login.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/login/otpverify_view.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/login/signup_phone_view.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/onboarding/forgot_password/forgot_password.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/onboarding/onboarding.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/order/confirm_order.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/order/create_order.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/payment/payment.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/payment_history/payment_details.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/payment_history/payment_history.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/profile/profile.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/registration/registration.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/return_history/details_return_history.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/return_history/return_history.dart';
import 'package:Ababil_Courier_Merchant/presentation/screens/shop/create_shop.dart';

import 'package:Ababil_Courier_Merchant/presentation/screens/splash/splash.dart';

import '../../../data/bindings/dashboard_bindings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onboardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String loginPhoneRoute = '/loginPhone';
  static const String loginPhoneVerifyRoute = '/loginPhoneVerify';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/home';
  static const String inActiveRoute = '/inactive';
  static const String shop = '/shop';
  static const String createOrder = '/createOrder';
  static const String order = '/order';
  static const String profile = '/profile';
  static const String payment = '/payment';
  static const String executive = '/executive';
  static const String historyOrder = '/historyOrder';
  static const String historyPayment = '/historyPayment';
  static const String incomplete = '/incomplete';
  static const String historyReturn = '/historyReturn';
  static const String historyReturnDetails = '/historyReturnDetails';
  static const String detailsHistoryPayment = '/detailsHistoryPayment';
}

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.initialRoute,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.inActiveRoute,
      page: () => const InActiveView(),
    ),
    GetPage(
      name: Routes.onboardingRoute,
      page: () => const OnboardingView(),
    ),
    GetPage(
      name: Routes.loginRoute,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.loginPhoneRoute,
      page: () => const SignupPhoneView(),
    ),
    GetPage(
        name: Routes.incomplete,
        page: () => const IncompleteView(),
        binding: IncompleteBindings()),
    GetPage(
      name: Routes.loginPhoneVerifyRoute,
      page: () => const OtpVerifyView(),
    ),
    GetPage(
        name: Routes.registerRoute,
        page: () => const RegisterView(),
        binding: RegistrationBindings()),
    GetPage(
      name: Routes.forgotPasswordRoute,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(
        name: Routes.homeRoute,
        page: () => const HomeView(),
        binding: DashboardBindings()),
    GetPage(
        name: Routes.shop,
        page: () => const CreateShopView(),
        binding: ShopBindings()),
    GetPage(
        name: Routes.createOrder,
        page: () => const CreateOrderView(),
        binding: OrderBindings()),
    GetPage(
        name: Routes.order,
        page: () => const ConfirmOrderView(),
        binding: OrderBindings()),
    GetPage(
        name: Routes.profile,
        page: () => const ProfileView(),
        binding: UserInfoBindings()),
    GetPage(
        name: Routes.payment,
        page: () => const PaymentView(),
        binding: PaymentBindings()),
    GetPage(
        name: Routes.executive,
        page: () => const ExecutiveView(),
        binding: ShopBindings()),
    GetPage(
        name: Routes.historyOrder,
        page: () => const OrderHistoryView(),
        binding: OrderHistoryBindings()),
    GetPage(
        name: Routes.historyPayment,
        page: () => const PaymentHistoryView(),
        binding: PaymentHistoryBindings()),
    GetPage(
        name: Routes.historyReturn,
        page: () => const ReturnHistoryView(),
        binding: ReturnHistoryBindings()),
    GetPage (
      name: Routes.detailsHistoryPayment,
      page: () => const PaymentDetailHistoryView(),
      //binding: DetailsPaymentHistoryBindings(invoiceId: Get.arguments ?? ''),
    ),
    GetPage(
      name: Routes.historyReturnDetails,
      page: () => const ReturnDetailHistoryView(),
      // binding: DetailsPaymentHistoryBindings(invoiceId: Get.arguments ?? '')
    ),
  ];
}


// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.initialRoute:
//         return MaterialPageRoute(builder: (_) => const SplashView());
//       case Routes.onboardingRoute:
//         return MaterialPageRoute(builder: (_) => const OnboardingView());
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_) => const LoginView());
//       case Routes.registerRoute:
//         return MaterialPageRoute(builder: (_) => const RegisterView());
//       case Routes.forgotPasswordRoute:
//         return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
//       case Routes.homeRoute:
//         return MaterialPageRoute(builder: (_) => const HomeView());
//       case Routes.shop:
//         return MaterialPageRoute(builder: (_) => const CreateShopView());

//       default:
//         return unDefineRoute();
//     }
//   }
  

//   static Route<dynamic> unDefineRoute() {
//     return MaterialPageRoute(
//         builder: (_) => Scaffold(
//               appBar: AppBar(
//                 title: const Text(AppStrings.noRouteFound),
//               ),
//               body: const Center(
//                 child: Text(AppStrings.noRouteFound),
//               ),
//             ));
//   }
// }

