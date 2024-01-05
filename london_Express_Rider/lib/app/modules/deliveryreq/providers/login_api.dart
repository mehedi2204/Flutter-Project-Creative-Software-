// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../const/base_url.dart';
//
// class LoginApi extends GetConnect {
//
//   //Get Verify Otp Code
//   static Future<dynamic> getOtpVarify({
//     String? trkId,
//     String? otp_code,
//   }) =>
//       http
//           .post(Uri.parse('${BaseUrl.basedUrl}/api/rider-return-confirm?tracking_id=$trkId&security_code=$otp_code'), body: {
//             'tracking_id': trkId,
//             'security_code': otp_code,
//           })
//           .then((value) => {print(value.body.toString())})
//           .onError((error, stackTrace) => Future.error(error.toString()));
//
// }
