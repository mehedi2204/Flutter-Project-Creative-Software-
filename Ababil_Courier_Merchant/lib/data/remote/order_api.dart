import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/local/storage_healper.dart';
import 'package:Ababil_Courier_Merchant/data/model/confirm_orders_response.dart';
import 'package:Ababil_Courier_Merchant/data/model/shopsresponse.dart';
import 'package:Ababil_Courier_Merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class OrderApi extends GetConnect {
  //Store New Shop By Merchant
  Future<dynamic> getStore(Shop shop) => http
      .post(Uri.parse('${BaseUrl.baseUrl}/shop_store'),
          headers: <String, String>{
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
          },
          body: {
            'shop_name': shop.shopName,
            'shop_phone': shop.shopPhone,
            'shop_area': shop.shopArea,
            'zone_id': shop.zoneId.toString(),
            'address': shop.shopAddress,
            'link': shop.shopLink,
          })
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

//Get Shop List By User Id
  Future<dynamic> getdatas() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/orderDatas'),
        headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

//Get Shop List By User Id
  Future<dynamic> getShops() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/showshoplist'),
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

      //Get Shop List By User Id
  Future<dynamic> getDistArea({required int Id}) => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/dist-area?id=$Id'),
        headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
      
//Get Shop List By User Id
  Future<dynamic> getBranchs() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/zone_list'),
        headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Get Shop List By User Id
  Future<dynamic> getWeights() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/weights'),
        headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Get Shop List By User Id
  Future<dynamic> getAreas() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/coverageArealist'),
        headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Get Shop List By User Id
  Future<dynamic> getCategories() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/category'),
        headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Get Shop List By User Id
  Future<dynamic> getPickupTimes() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/pickUpTime'),
        headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
//Confirms Order By Id
  Future<dynamic> getConfirmOrders(
          {required String formDate, required String today}) =>
      http
          .get(
            Uri.parse(
                '${BaseUrl.baseUrl}/confirm_orders?fromdate=$formDate&todate=$today'),
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
            },
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));

  Future<dynamic> getCreateOrder(Order order) => http
      .post(Uri.parse('${BaseUrl.baseUrl}/orderstor'),
          headers: <String, String>{
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
          },
          body: {
            'customer_name': order.customerName,
            'customer_phone': order.customerPhone,
            'customer_address': order.customerAddress,
            'shop': order.shop,
            'area': order.area,
            'category': order.category,
            'weight': order.weight,
            'collection': order.colection.toString(),
            'remarks': order.remarks,
            'pickup_date': order.pickupDate,
            'pickup_time': order.pickupTime,
            'imp': order.type.toString(),
            'isPartial': order.isPartial.toString(),
          })
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
