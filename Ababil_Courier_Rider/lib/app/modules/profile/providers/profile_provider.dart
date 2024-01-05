import 'package:amvines_rider_new/app/const/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/storage_healper.dart';

class ProfileProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  ///get Home Sliders List
  Future getUserInfo() => http
      .get(
        Uri.parse('${BaseUrl.basedUrl}/api/user-info'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => value)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
