import 'package:amvines_rider_new/app/const/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/storage_healper.dart';

class PickupreqProvider extends GetConnect {
  /*
 * This Method is use for Fetching All Pickup Request.
 *  Fetching All Pickup Request by User Token
 */

  Future<dynamic> getpickupreqlist() => http
      .get(
    Uri.parse('${BaseUrl.basedUrl}/api/pickupreq'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
    },
  )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

/*
 * This Method is use for Collect order.
 *  Collect order by tracking Id
 */

  Future<dynamic> getOderCollect({required String? trkId}) => http
      .get(
        Uri.parse("${BaseUrl.basedUrl}/api/Collect?tracking_id=$trkId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => print(value.body.toString()))
      .onError((error, stackTrace) => Future.error(error.toString()));

/*
 * This Method is use for cancel order.
 *  cancel order by tracking Id
 */

  Future<dynamic> getOderCancel({required String? trkId}) => http
      .get(
        Uri.parse("${BaseUrl.basedUrl}/api/cancel?tracking_id=$trkId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
