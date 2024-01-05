import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidgets extends StatelessWidget {
  final String? label;
  final VoidCallback? press;
  final Color? clr;
  final bool? isClose;
  final double height;
  final double width;
  final double tl;
  final double tr;
  final double bl;
  final double br;

  const ButtonWidgets(
      {Key? key,
      required this.label,
      required this.press,
      this.clr,
      this.isClose = false,
      this.height = 55.0,
      this.width = 55.0,
      this.bl = 20,
      this.br = 20,
      this.tl = 20,
      this.tr = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: height,
        width: width,
        //width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: isClose == true ? Colors.transparent : clr,
            border: Border.all(
              width: 2,
              color: isClose == true
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr!,
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(tl), topRight: Radius.circular(tr), bottomRight: Radius.circular(br), bottomLeft: Radius.circular(bl))),
        child: Center(
          child: Text(
            label!,
            // style: isClose!
            //     ? CustomThemes().titleStyle
            //     : CustomThemes()
            //         .titleStyle
            //         .copyWith(color: Colors.white, wordSpacing: 2),
          ),
        ),
      ),
    );
  }
}
