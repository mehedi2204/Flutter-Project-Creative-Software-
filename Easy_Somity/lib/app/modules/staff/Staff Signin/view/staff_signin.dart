import 'package:easy_somity/app/const/color_constant.dart';
import 'package:easy_somity/app/const/widgets/app_text.dart';
import 'package:easy_somity/app/modules/staff/Staff%20Signin/view/staff_sigin_with_phone.dart';
import 'package:easy_somity/app/modules/staff/Staff%20Signin/view/staff_signin_with_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../const/size_config.dart';
import '../../../../const/widgets/button.dart';
import '../../../../const/widgets/button_widgets.dart';

class StaffSigninPage extends StatelessWidget {
  const StaffSigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Container(
                width: double.maxFinite,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/logo.png'))),
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Get.to(()=> StaffSigninPhone());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      color: CustomColor.primary.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Icon(Icons.phone,color: CustomColor.white,size: 35,),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: 60,
                    decoration: BoxDecoration(
                      color: CustomColor.primary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(child: AppText(text: 'Signin with Phone',color: CustomColor.white,textAlign: TextAlign.center,fontWeight: FontWeight.bold,)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('-----------  '),
                AppText(text: 'or',fontWeight: FontWeight.bold,fontSize: 20,color: CustomColor.dPrimary,),
                Text('  -----------')
              ],
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Get.to(()=> StaffSigninEmail());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      color: CustomColor.primary.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Icon(Icons.email,color: CustomColor.white,size: 35,),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: 60,
                    decoration: BoxDecoration(
                      color: CustomColor.primary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(child: AppText(text: 'Signin with Email',color: CustomColor.white,textAlign: TextAlign.center,fontWeight: FontWeight.bold,)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
