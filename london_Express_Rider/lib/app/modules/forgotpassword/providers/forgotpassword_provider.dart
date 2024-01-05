import 'package:get/get.dart';

import '../../../const/base_url.dart';
import 'package:http/http.dart' as http;

class ForgotpasswordProvider extends GetConnect {
  Future<dynamic> getSendOtp({String? mobile}) => http
      .get(
        Uri.parse('${BaseUrl.basedUrl}/api/resetOtpCodeSend?mobile=$mobile'),
        headers: <String, String>{'Accept': 'application/json; charset=UTF-8'},
      )
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

  Future<dynamic> getChangePassword(
          {required String? password, required String? id}) =>
      http
          .get(
            Uri.parse(
                '${BaseUrl.basedUrl}/api/resetPass?id=$id&password=$password'),
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8'
            },
            // body: {
            //   "id": StorageHelper.readString(key: 'id').toString(),
            //   'password': password,
            // }
          )
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
