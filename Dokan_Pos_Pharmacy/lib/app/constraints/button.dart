import 'package:flutter/material.dart';

class CustomButtton extends StatelessWidget {
  
  final VoidCallback press;
  final String? title;
   final double? sizeHeight;
   final double? sizeWidth;
   final Color? color;

  const CustomButtton(
      {Key? key, required this.press, required this.title, this.sizeHeight, this.sizeWidth, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:press,
      child: Container(
        alignment: Alignment.center,
        height: sizeHeight,
        width: sizeWidth,
        decoration: BoxDecoration(
          color: color,
          /*border: Border.all(color: Color_me.grey,width: 2),*/
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
