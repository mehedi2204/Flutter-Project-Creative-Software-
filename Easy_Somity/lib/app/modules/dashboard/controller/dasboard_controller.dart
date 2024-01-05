
import 'package:easy_somity/app/const/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }
  List catNames = [
    "Loan Collection",
    "DPS Collection",
    "Loan Collection Report",
    "DPS Collection Report",
    "Member List",
    "Tutorial",
  ];


  List<Color> catColor = [
    Color(0xffffcf2f),
    Color(0xff6fe08d),
    Color(0xff61bdfd),
    Color(0xfffc7f7f),
    Color(0xffcb84fb),
    Color(0xff78e667),
  ];
  List<Icon> catIcons =[
    Icon(Icons.category,color: Colors.white,size: 30,),
    Icon(Icons.video_library,color: Colors.white,size: 30,),
    Icon(Icons.assignment,color: Colors.white,size: 30,),
    Icon(Icons.assignment,color: Colors.white,size: 30,),
    Icon(Icons.store,color: Colors.white,size: 30,),
    Icon(Icons.play_circle_fill,color: Colors.white,size: 30,),

  ];

  List<Icon> catBigIcons =[
    Icon(Icons.video_library,color: CustomColor.dPrimary,size: 20),
    Icon(Icons.assignment,color: CustomColor.dPrimary,size: 20,),
    Icon(Icons.store,color: CustomColor.dPrimary,size: 20),
    Icon(Icons.play_circle_fill,color: CustomColor.dPrimary,size: 20),
    Icon(Icons.emoji_events,color: CustomColor.dPrimary,size: 20),
  ];
  List catPrice = [
    0.00,
    0.00,
    0.00,
    0.00,
    0.00
  ];
}
