import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:flutter/material.dart';

class CustomButtton extends StatelessWidget {
  
  final VoidCallback press;
  final String? title;
  
  const CustomButtton(
      {Key? key, required this.press, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:press,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(
          color: AppColorsConst.dPrimaryColor,
          /*border: Border.all(color: Color_me.grey,width: 2),*/
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
