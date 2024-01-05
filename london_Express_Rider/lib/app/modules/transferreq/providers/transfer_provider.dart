import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/base_url.dart';
import '../../../const/storage_healper.dart';

class TransferProvider extends GetConnect {
  /*
 * This Method is use for Get Return Oder List.
 *  Return order by Token
 */

  Future<dynamic> getTransferOdrderList() => http
      .get(
        Uri.parse("${BaseUrl.basedUrl}/api/transfer_order"),
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

  Future<dynamic> getConfirm({required String invoiceId}) => http
      .post(
        Uri.parse("${BaseUrl.basedUrl}/api/rider_transfer_confirm"),
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
        body: <String, String>{'invoice_id': invoiceId},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
