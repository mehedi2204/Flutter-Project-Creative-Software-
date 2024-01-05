import 'package:easy_somity/app/modules/dashboard/bindings/dashboard_bindings.dart';
import 'package:easy_somity/app/modules/dashboard/controller/dasboard_controller.dart';
import 'package:easy_somity/app/modules/dashboard/view/dashboard_view.dart';
import 'package:get/get.dart';
import 'package:easy_somity/app/modules/dashboard/controller/dasboard_controller.dart';
import '../modules/home/view/home_view.dart';
import '../modules/signin/view/signin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

static const INITIAL = Routes.HOME;

static final routes = [
  GetPage(
    name: _Paths.HOME,
    page: () =>  HomeView(),
    // binding: HomeBinding(),
  ),
  // GetPage(
  //   name: _Paths.SPLASH,
  //   page: () => const SplashView(),
  // ),
  GetPage(
    name: _Paths.SIGNIN,
    page: () => const SigninView(),
    // binding: SigninBinding(),
  ),
  GetPage(
    name: _Paths.DASHBOARD,
    page: () =>  DashboardView(),
    binding: DashboardBinding(),
  ),

];}