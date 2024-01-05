import 'dart:ui';

import 'package:easy_somity/app/const/color_constant.dart';
import 'package:easy_somity/app/const/storage_healper.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../const/text_style_constant.dart';
import '../../../const/widgets/app_text.dart';
import '../../../const/widgets/button.dart';
import '../../../routes/app_pages.dart';
import '../../staff/Staff Signin/view/staff_signin.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}
int isSelect = 1;
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColor.lPrimary,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              // border:Border.all(color: Colors.white, width: 3),
              ),
          padding: EdgeInsets.only(bottom: 50),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColor.primary,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  // margin: EdgeInsets.all(10),
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        AppText(
                          textAlign: TextAlign.center,
                          text: 'Welcome to Easy Somity',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.white,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        AppText(
                          text:
                              "Easy Samity is a provider of multi-purpose cooperative society management software.",
                          textAlign: TextAlign.center,
                          fontSize: 16,
                          color: CustomColor.white.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(top: 10,right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          isSelect = 1;
                          StorageHelper.remove(
                            key: 'lan',
                          );
                          Get.updateLocale(const Locale('en', 'US'));
                        },
                        child: Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                            color: isSelect == 1 ? Colors.green: Colors.transparent,
                            border:Border.all(
                              color: CustomColor.white,
                              width: 2
                            ),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                          ),
                          child: Center(child: AppText(text: 'En',fontSize: 16,color: CustomColor.white,textAlign: TextAlign.center,)),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          isSelect = 2;
                          Get.updateLocale(const Locale('bn', 'BD'));
                          StorageHelper.setString(key: 'lan', value: 'bn');
                        },
                        child: Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              color: isSelect == 2 ? Colors.green: Colors.transparent,
                              border:Border.all(
                                  color: CustomColor.white,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                          ),
                          child: Center(child: AppText(text: 'বাং',fontSize: 16,color: CustomColor.white,textAlign: TextAlign.center,)),
                        ),
                      ),
                    ],
                  ),

                  /*TextButton(
                    onPressed: () {
                      if (StorageHelper.readString(key: 'lan') == 'en') {
                        Get.updateLocale(const Locale('bn', 'BD'));
                        StorageHelper.setString(key: 'lan', value: 'bn');
                        ;
                      } else {
                        Get.updateLocale(const Locale('en', 'US'));
                        StorageHelper.setString(key: 'lan', value: 'en');
                      }
                      print(StorageHelper.readString(key: 'lan'));
                    },
                    child: StorageHelper.readString(key: 'lan') == 'en'
                        ? *//*Flag.fromCode(
                            FlagsCode.US,
                            height: 40,
                            width: 40,
                          )
                        : Flag.fromCode(
                            FlagsCode.BD,
                            height: 40,
                            width: 40,
                          ),*//* AppText(text: 'En',color: Colors.white,):AppText(text: 'Bn',color: Colors.white,)
                    *//*icon: Icon(
                      Icons.g_translate, color: Colors.white, size: 30,)*//*
                  ),*/
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      color: CustomColor.lPrimary,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(60))),
                  height: 100,
                ),
              ),
              // Positioned(
              //   top: MediaQuery.of(context).size.height * 0.55,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     height: 200,
              //     width: width,
              //     // child: Column(
              //     //   children: [
              //     //     AppText(
              //     //       textAlign: TextAlign.center,
              //     //       text: 'Welcome to Easy Somity',
              //     //       fontSize: 30,
              //     //       fontWeight: FontWeight.bold,
              //     //       color: Colors.white,
              //     //     ),
              //     //     SizedBox(
              //     //       height: 10,
              //     //     ),
              //     //     AppText(
              //     //       text:
              //     //           'Easy Samity is a multi-purpose cooperative society management software provider.',
              //     //       textAlign: TextAlign.center,
              //     //       fontSize: 16,
              //     //       color: Colors.white,
              //     //     ),
              //     //   ],
              //     // ),
              //   ),
              // ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(top: height * 0.2, bottom: 50),
                  width: width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        text: 'Login For',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: CustomColor.dPrimary.withOpacity(0.8),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.SIGNIN);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: CustomColor.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          spreadRadius: 2,
                                          color: CustomColor.grey)
                                    ]
                                    // border:Border.all(color: Colors.white, width: 3)
                                    ),
                                height: 50,
                                // width: width*0.8,
                                child: Center(
                                    child: AppText(
                                  fontSize: 20,
                                  color: CustomColor.dPrimary,
                                  text: 'MEMBER',
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(()=>StaffSigninPage());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        spreadRadius: 3,
                                        color: Colors.grey)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  // border:Border.all(color: Colors.white, width: 3)
                                ),
                                height: 50,
                                // width: width*0.8,
                                child: Center(
                                    child: AppText(
                                  fontSize: 20,
                                  text: 'STAFF',
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.dPrimary,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 3,
                                color: Colors.grey)
                          ],
                          color: CustomColor.lPrimary,
                          borderRadius: BorderRadius.circular(10),
                          // border:Border.all(color: Colors.white, width: 3)
                        ),
                        height: 70,
                        // width: width*0.8,
                        child: Center(
                            child: AppText(
                          fontSize: 20,
                          text: 'CLICK FOR DETAILS',
                          fontWeight: FontWeight.bold,
                          color: CustomColor.dPrimary,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: AppText(
                    text: 'Develop by Creative Software',
                    fontSize: 15,
                    color: CustomColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
