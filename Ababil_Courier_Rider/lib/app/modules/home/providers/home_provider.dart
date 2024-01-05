import 'package:amvines_rider_new/app/const/storage_healper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/base_url.dart';

class HomeProvider extends GetConnect {
  Future<dynamic> getDashboardData({String? email, String? password}) => http
      .get(
        Uri.parse('${BaseUrl.basedUrl}/api/pickupdashboard'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
