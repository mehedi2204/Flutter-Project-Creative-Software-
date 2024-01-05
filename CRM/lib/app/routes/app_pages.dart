import 'package:crm/app/modules/signin/view/signin_option_view.dart';
import 'package:get/get.dart';
import '../modules/dashboard/bindings/dashboard_bindings.dart';
import '../modules/dashboard/view/dashboard_view.dart';
import '../modules/home/view/home_view.dart';
import '../modules/signin/view/admin_signin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

static const INITIAL = Routes.HOME;
  static const DashBoard = Routes.DASHBOARD;

static final routes = [
  GetPage(
    name: _Paths.HOME,
    page: () =>  SliderScreenView(),
    // binding: HomeBinding(),
  ),
  // GetPage(
  //   name: _Paths.SPLASH,
  //   page: () => const SplashView(),
  // ),
  GetPage(
    name: _Paths.SIGNIN,
    page: () => const SignInOptionView(),
    // binding: SigninBinding(),
  ),
  GetPage(
    name: _Paths.DASHBOARD,
    page: () =>  DashboardView(),
    //binding: DashboardBinding(),
  ),

];}