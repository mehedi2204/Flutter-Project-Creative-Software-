import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/inactive_account_controller.dart';

class InactiveAccountView extends GetView<InactiveAccountController> {
  const InactiveAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.offAllNamed(Routes.LOGIN);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColorsConst.dPrimaryColor,
          ),
        ),
     
        elevation: 0,
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(20),
        height: 300,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: Text('In-Active Account',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: AppColorsConst.dPrimaryColor)),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Your Rider account registration is on processing and will be verified soon. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      )),
                ))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
