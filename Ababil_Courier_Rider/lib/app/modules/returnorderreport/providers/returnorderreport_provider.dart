import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/base_url.dart';
import '../../../const/storage_healper.dart';

class ReturnorderreportProvider extends GetConnect {
  Future<dynamic> getReturnOrderList(
          {required final formdate, required final todate}) =>
      http
          .post(
            Uri.parse(
                '${BaseUrl.basedUrl}/api/return_datewise?fromdate=$formdate&todate=$todate'),
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization':
                  'Bearer ${StorageHelper.readString(key: 'token')}'
            },
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
