import 'dart:io';

import 'package:amvines_rider_new/app/const/base_url.dart';
import 'package:amvines_rider_new/app/const/storage_healper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeliveryreqProvider extends GetConnect {
  /*
 * This Method is use for Fetching All Delivery Request.
 *  Fetching All Delivery Request by User Token
 */
  Future<dynamic> getDeliveryreqlist() => http
      .get(
        Uri.parse('${BaseUrl.basedUrl}/api/deliveryAssign'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

  /*
 * This Method is use for Confirm Order.
 *  Confirm Order by User Token,Trck Id ,Signature,ConfirmImage.
 */
  Future<dynamic> getDelevered({required String? trkId}) async => http
      .post(
        Uri.parse("${BaseUrl.basedUrl}/api/order-delivered?tracking_id=$trkId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => {print(value.body.toString())})
      .onError((error, stackTrace) => Future.error(error.toString()));

  Future<dynamic> sendOTP({required String? trkId}) async => http
      .post(
        Uri.parse("${BaseUrl.basedUrl}/api/rider-return?tracking_id=$trkId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
        },
      )
      .then((value) => {print(value.body.toString())})
      .onError((error, stackTrace) => Future.error(error.toString()));

  Future<dynamic> getOtpVarify(
          {required String? trkId, required String? otp_code}) async =>
      http
          .post(
              Uri.parse(
                  "${BaseUrl.basedUrl}/api/rider-return-confirm?tracking_id=$trkId&security_code=$otp_code"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization':
                    'Bearer ${StorageHelper.readString(key: 'token')}'
              })
          .then(
              (value) => {print(value.body.toString())}) //value.body.toString()
          .onError((error, stackTrace) => Future.error(error.toString()));

  Future<dynamic> getDeliveryConfirm(
      {required String trkId,
      required File? signatureImage,
      required File? confirmImage}) async {
    String addimageUrl = '${BaseUrl.basedUrl}/api/delivered';
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${StorageHelper.readString(key: 'token')}'
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl));
    request.headers.addAll(headers);
    request.fields.addAll({
      'tracking_id': trkId,
    });
    request.files.addAll({
      await http.MultipartFile.fromPath(
          'signature_image', signatureImage!.path),
      await http.MultipartFile.fromPath('confirm_image', confirmImage!.path),
    });

    return request.send();
  }

  /*
 * This Method is use for Cancel Order.
 *  Cancel Order by User Token,Trck Id .
 */
  Future<dynamic> getDeliveryCancel({
    required String trkId,
  }) =>
      http
          .get(
              Uri.parse(
                  '${BaseUrl.basedUrl}/api/cancel_order?tracking_id=$trkId'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization':
                    'Bearer ${StorageHelper.readString(key: 'token')}'
              })
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));

/*
 * This Method is use for Hold Order.
 *  Hold Order by User Token,Trck Id .
 */
  Future<dynamic> getDeliveryOption({
    required String trkId,
    required String type,
    required String note,
    required String date,
  }) =>
      http
          .post(Uri.parse('${BaseUrl.basedUrl}/api/deliveredOption'),
              headers: <String, String>{
                'Accept': 'application/json; charset=UTF-8',
                'Authorization':
                    'Bearer ${StorageHelper.readString(key: 'token')}'
              },
              body: {
                'type': type,
                'tracking_id': trkId,
                'date': date,
                'note': note,
              })
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));

/*
 * This Method is use for partialDelivery Order.
 *  Hold Order by User Token,Trck Id .
 */
  Future<dynamic> getPartiallyDelivery({
    required String trkId,
    required String securityCode,
    required String note,
    required String collection,
  }) =>
      http
          .post(Uri.parse('${BaseUrl.basedUrl}/api/partialDelivery'),
              headers: <String, String>{
                'Accept': 'application/json; charset=UTF-8',
                'Authorization':
                    'Bearer ${StorageHelper.readString(key: 'token')}'
              },
              body: {
                'security_code': securityCode,
                'collection': collection,
                'tracking_id': trkId,
                'note': note,
              })
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));

  /*
 * This Method is use for Resend User Code.
 *  Hold Order by User Token,Trck Id .
 */

  Future<dynamic> getSendCode({
    required String trkId,
  }) =>
      http
          .post(
            Uri.parse(
                '${BaseUrl.basedUrl}/api/rider_code_resend?tracking_id=$trkId&rider_id=${StorageHelper.readString(key: 'id')}'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization':
                  'Bearer ${StorageHelper.readString(key: 'token')}'
            },
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));

  /*
 * This Method is use for Verify User.
 *  Hold Order by User Token,Trck Id .
 */
  Future<dynamic> getVarifyUser({
    required String trkId,
    required String code,
  }) =>
      http
          .post(
            Uri.parse(
                '${BaseUrl.basedUrl}/api/rider_code_check?tracking_id=$trkId&code=$code'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization':
                  'Bearer ${StorageHelper.readString(key: 'token')}'
            },
            // body: {
            //   'tracking_id': trkId,
            //   'code': code,
            // }
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
