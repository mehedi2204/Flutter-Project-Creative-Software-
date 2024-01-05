import 'package:amvines_rider_new/app/const/base_url.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../../const/storage_healper.dart';

class ChangepasswordProvider extends GetConnect {
  Future<dynamic> getChangePassword({
    required String oldpPassword,
    required String newPassword,
  }) =>
      http
          .post(Uri.parse('${BaseUrl.basedUrl}/api/changePassword'),
              headers: <String, String>{
                'Accept': 'application/json; charset=UTF-8',
                'Authorization':
                    'Bearer ${StorageHelper.readString(key: 'token')}'
              },
              body: {
                "new_password": newPassword,
                'old_password': oldpPassword,
              })
          .then((value) => value.body)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
