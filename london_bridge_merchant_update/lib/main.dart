import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lbdl_merchant/app/app.dart';
import 'package:lbdl_merchant/data/local/storage_healper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageHelper.init(await SharedPreferences.getInstance());
  runApp(MyApp());
}
//com.edak.merchant