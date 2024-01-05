import 'package:get/get.dart';
import 'package:Ababil_Courier_Merchant/data/utils/base_url.dart';
import 'package:http/http.dart' as http;

class LoginApi extends GetConnect {
  static Future<dynamic> getlogin({String? email, String? password}) => http
      .post(Uri.parse('${BaseUrl.baseUrl}/login'), body: {
        'email': email,
        'password': password,
      })
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));

//Get Login with Phone
  static Future<dynamic> getOtplogin({
    String? mobile,
  }) =>
      http
          .post(Uri.parse('${BaseUrl.baseUrl}/otp_login'),
              headers: <String, String>{
                'Accept': 'application/json; charset=UTF-8',
              },
              body: {
                'mobile': mobile,
                'role': '12',
              })
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));

  //Get Verify Otp Code
  static Future<dynamic> getOtpVarify({
    String? mobile,
    String? otp_code,
  }) =>
      http
          .post(Uri.parse('${BaseUrl.baseUrl}/otp_verification'), body: {
            'mobile': mobile,
            'otp_code': otp_code,
          })
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
