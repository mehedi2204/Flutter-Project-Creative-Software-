import 'package:amvines_rider_new/app/const/storage_healper.dart';
import 'package:get/get.dart';

import '../../../const/base_url.dart';
import 'package:http/http.dart' as http;

class TransferderreportProvider extends GetConnect {
  
  Future<dynamic> getTransferOdrderList(
          {required final formdate, required final todate}) =>
      http
          .get(
            Uri.parse(
                '${BaseUrl.basedUrl}/api/transfer_order_report?fromdate=$formdate&todate=$todate'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization':
                  'Bearer ${StorageHelper.readString(key: 'token')}'
            },
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
