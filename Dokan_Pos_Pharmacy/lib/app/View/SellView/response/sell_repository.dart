import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constraints/base_url.dart';
import '../../../constraints/storage_healper.dart';

class SellResponse extends GetConnect {
  Future<dynamic> getProductList() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/sale/stock-product-list'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: "token")}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
