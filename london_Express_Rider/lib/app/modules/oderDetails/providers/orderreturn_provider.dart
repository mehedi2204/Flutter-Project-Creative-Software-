import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/base_url.dart';
import '../../../const/storage_healper.dart';

class OrderDetailsProvider extends GetConnect {
  /*
 * This Method is use for Get Return Oder List.
 *  Return order by Token
 */

  Future<dynamic> getReturnOdrderList({required String invoiceId}) => http
      .get(
        Uri.parse(
            "${BaseUrl.basedUrl}/api/rider_transfer_details"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => {print(value.body)})
      .onError((error, stackTrace) => Future.error(error.toString()));
  /*
 * This Method is use for Collect order.
 *  Collect order by tracking Id
 */

  Future<dynamic> getTransferOdrderList({required String invoiceId}) => http
      .get(
        Uri.parse(
            "${BaseUrl.basedUrl}/api/rider_transfer_details?invoice_id=$invoiceId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
