import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/base_url.dart';
import '../../../const/storage_healper.dart';

class OrderreturnProvider extends GetConnect {
  /*
 * This Method is use for Get Return Oder List.
 *  Return order by Token
 */

  Future<dynamic> getReturnOdrderList() => http
      .get(
        Uri.parse("${BaseUrl.basedUrl}/api/return_order"),
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

  Future<dynamic> getOrderReturn(
          {required String invoiceId, required String securityCode}) =>
      http
          .post(
            Uri.parse("${BaseUrl.basedUrl}/api/rider_return_confirm"),
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization':
                  'Bearer ${StorageHelper.readString(key: 'token')}'
            },
            body: <String, String>{
              'invoice_id': invoiceId,
              'security_code': securityCode.toString()
            },
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
