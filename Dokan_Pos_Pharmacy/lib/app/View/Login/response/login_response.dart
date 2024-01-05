import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constraints/base_url.dart';

class LoginResponse extends GetConnect {
  Future<dynamic> getLogin({String? mobile, String? password}) => http
      .post(Uri.parse('${BaseUrl.baseUrl}/login'), body: {
        'mobile': mobile,
        'password': password,
      })
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
