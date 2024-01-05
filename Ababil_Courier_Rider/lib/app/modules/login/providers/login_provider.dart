import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../const/base_url.dart';

class LoginProvider extends GetConnect {

  
  Future<dynamic> getlogin({String? email, String? password}) => http
      .post(Uri.parse('${BaseUrl.basedUrl}/api/login'), body: {
        'email': email,
        'password': password,
      })
      .then((value) => value.body)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
