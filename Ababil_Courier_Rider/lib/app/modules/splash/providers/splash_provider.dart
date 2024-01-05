import 'package:amvines_rider_new/app/const/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:amvines_rider_new/app/const/storage_healper.dart';

class SplashProvider extends GetConnect {
  // Future <dynamic> get getUserInfo()=>

  Future<dynamic> getUserInfo() => http
      .get(
        Uri.parse('${BaseUrl.basedUrl}/api/user-info'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
