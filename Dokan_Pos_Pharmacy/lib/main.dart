import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/constraints/storage_healper.dart';
import 'app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StorageHelper.init(await SharedPreferences.getInstance());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rider",
      // translationsKeys: AppTranslation.translationsKeys,
      // locale: StorageHelper.readString(key: 'lan') != null
      //     ? const Locale('bn', 'BD')
      //     : const Locale('en', 'US'),
      // fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
