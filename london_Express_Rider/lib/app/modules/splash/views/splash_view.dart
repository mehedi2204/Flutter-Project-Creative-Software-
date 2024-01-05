import 'package:amvines_rider_new/app/const/size_config.dart';
import 'package:amvines_rider_new/app/routes/app_pages.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../const/storage_healper.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    //StorageHelper.eraseAll();////////////////////

    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/png/rider.png',
        duration: 2000,
        splashIconSize: 70,
        splashTransition: SplashTransition.scaleTransition,
        nextRoute: controller.logstate.value
            ? StorageHelper.readInt(
                      key: 'role',
                    ) ==
                    11
                ? Routes.INACTIVE_ACCOUNT
                : Routes.HOME
            : Routes.LOGIN,
        nextScreen: const Text(''),
        // nextScreen: controller.logstate.value
        //     ? controller.role.value == 11
        //         ? InactiveAccountView()
        //         : HomeView()
        //     : const LoginView(),
      ),
    );
  }
}
