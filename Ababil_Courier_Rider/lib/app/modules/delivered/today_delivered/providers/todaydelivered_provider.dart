import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../const/base_url.dart';
import '../../../../const/storage_healper.dart';

class TodayDeliveredProvider extends GetConnect {
  /*
 * This Method is use for Get Return Oder List.
 *  Return order by Token
 */

  Future<dynamic> getTodayDeliveredList() => http
      .get(
        Uri.parse("${BaseUrl.basedUrl}/api/rider-today-delivered"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
