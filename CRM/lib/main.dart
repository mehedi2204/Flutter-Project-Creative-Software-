import 'package:crm/app/controller/admin_email_signin_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/const/storage_healper.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StorageHelper.init(await SharedPreferences.getInstance());
  final sharedPreferences = await SharedPreferences.getInstance();

  final accessToken = sharedPreferences.getString('accessToken');

  print('Access Token: $accessToken');

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart CRM",
      initialRoute: accessToken != '' && accessToken != null
          ? AppPages.DashBoard
          : AppPages.INITIAL,
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
