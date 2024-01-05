import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/local/storage_healper.dart';
import 'package:Ababil_Courier_Merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class OrderHistoryApi extends GetConnect {
//Confirms Order By Id
  Future<dynamic> getConfirmOrders(
          {required String? fDate, required String? tDate, required status}) =>
      http
          .get(
            Uri.parse(
                '${BaseUrl.baseUrl}/confirm_orders?fromdate=$fDate&todate=$tDate&status=$status'),
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
            },
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
