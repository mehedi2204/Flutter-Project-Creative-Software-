import 'package:amvines_rider_new/app/const/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/storage_healper.dart';

class PickupassignProvider extends GetConnect {
  /*
 * This Method is use for Fetching All Pickup Request.
 *  Fetching All Pickup Request by User Token
 */

  Future<dynamic> getpickupassignlist() => http
      .get(
        Uri.parse('${BaseUrl.basedUrl}/api/pick-up-request-assign/list/auto'),
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

  Future<dynamic> getOderAssign({required String trkId}) => http
      .post(
        Uri.parse(
            "${BaseUrl.basedUrl}/api/pick-up-request-assign/collect/auto"),
        headers: <String, String>{
          // 'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
        body: <String, String>{'id': trkId},
      )
      .then((value) => value.body)
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
