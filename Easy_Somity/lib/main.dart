import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/const/storage_healper.dart';
import 'app/local/translation.dart';
import 'app/modules/dashboard/controller/loan_collection_controller.dart';
import 'app/modules/signin/loginController.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoanController());
  Get.config(enableLog: false);
  StorageHelper.init(await SharedPreferences.getInstance());


  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rider",
      translationsKeys: AppTranslation.translationsKeys,
      locale: StorageHelper.readString(key: 'lan') != null
          ? const Locale('bn', 'BD')
          : const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
