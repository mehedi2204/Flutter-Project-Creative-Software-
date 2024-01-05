import 'package:amvines_rider_new/app/const/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/resgistredmodel.dart';

class SignupProvider extends GetConnect {
  //  ///Get  Coupon List By User Token
  // Future getDisstrictList() async {
  //   final response = await http.get(
  //     Uri.parse('https://logistic.amvines.com/api/district_data'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   List body = json.decode(response.body) as List;
  //   if (response.statusCode == 200) {
  //     if (kDebugMode) {
  //       print(response.body);
  //     }

  //     distList = body.map((d) => DistrictResponse.fromJson(d)).toList();
  //     if (distList.isNotEmpty) {
  //       selectValue = distList[0];
  //       getDisstrictWiseAreList(distList[0].name!);
  //     }
  //   } else {
  //     if (kDebugMode) {
  //       print('No Data Found' + response.statusCode.toString());
  //     }
  //   }
  //   loader = false;
  //   setState(() {});
  // }

  /*
    GET District List
  */
  Future getDisstrictList() => http
      .get(
        Uri.parse('${BaseUrl.basedUrl}/api/zone_list'),
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
        },
      )
      .then((value) => value)
      .onError((error, stackTrace) => Future.error(error.toString()));
  /*
    GET DisWise Area List
  */
  Future getDisstrictWiseAreList(String dist) => http
      .get(
        Uri.parse('${BaseUrl.basedUrl}/api/area_data?district=$dist'),
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
        },
      )
      .then((value) => value)
      .onError((error, stackTrace) => Future.error(error.toString()));

  /*
    Rider Register
  */
  Future riderRegister(RegistredModel registredModel) async {
    String addimageUrl = '${BaseUrl.basedUrl}/api/rider-registration';
    Map<String, String> headers = {'Accept': 'multipart/form-data'};
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl));
    request.headers.addAll(headers);
    request.fields.addAll({
      'name': registredModel.getname,
      'mobile': registredModel.getmobile,
      'email': registredModel.getemail,
      'password': registredModel.getpassword,
      'present_address': registredModel.getpresentAddress,
      'permanent_address': registredModel.getpermanentAddress,
      'fathers_name': registredModel.getfathersName,
      'fathers_phone_no': registredModel.getfatherVoterIdNo,
      'voter_id_no': registredModel.getvoterIdNo,
      'district': registredModel.getdistrict,
      'area': registredModel.getarea,
      'zone_id': registredModel.getzoneId,
    });
    request.files.addAll({
      await http.MultipartFile.fromPath(
          'profile_photo', registredModel.getprofilePhoto.path),
      await http.MultipartFile.fromPath(
          'user_voter_id_photo', registredModel.getuserVoterIdPhoto.path),
      await http.MultipartFile.fromPath(
          'fathers_voter_id_photo', registredModel.getfathersVoterIdPhoto.path)
    });
    return await request.send();
  }
}
