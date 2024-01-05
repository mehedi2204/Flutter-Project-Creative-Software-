import 'dart:convert';

import 'package:amvines_rider_new/app/const/storage_healper.dart';
import 'package:amvines_rider_new/app/modules/splash/providers/splash_provider.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashProvider? splashProvider;
  RxBool logstate = true.obs;

  SplashController({required this.splashProvider});

  RxInt role = 0.obs;
  @override
  void onInit() {
    StorageHelper.readString(key: 'token');
    if (StorageHelper.readString(key: 'token') != null) {
      logstate.value = StorageHelper.readBool(key: 'islogged') ?? false;
      getUserInfo();
    } else {
      logstate.value = false;
    }

    super.onInit();
  }

  @override
  void onClose() {}
   getUserInfo() async {
    await splashProvider!.getUserInfo().then((value) {
      var body = json.decode(value);
     
      if (body['success'] == true) {
        role.value = 11;
        StorageHelper.setInt(
          key: 'role',
          value: body['user']['role'],
        );
       
      }
    }).onError((error, stackTrace) {
      print(error.toString());

       StorageHelper.eraseAll();
       
    });
    // role.value = 11;
  }
}
