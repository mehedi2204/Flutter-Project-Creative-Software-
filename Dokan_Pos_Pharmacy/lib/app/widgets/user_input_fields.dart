import 'package:dokan_pos/app/constraints/custom_color.dart';
import 'package:flutter/material.dart';

import '../constraints/styling.dart';
import 'app_text.dart';

class UserInputFields extends StatelessWidget {
  final TextEditingController? controller;
  final String lavelName, histsName;
  final IconData? iconData;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function validateFunction;
  final bool obscureText;
  final int maxLines;
  final String star;
  final VoidCallback? press;
  final Color? color;
  final double? fontSizeLevel;
  final double? tl;
  final double? tr;
  final double? bl;
  final double? br;

   UserInputFields({
    Key? key,
     this.controller,
    required this.lavelName,
    required this.histsName,
    this.tr = 10,
    this.bl = 10,
    this.tl = 10,
    this.br =10,
    this.iconData,
    this.fontSizeLevel,
    this.color,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    required this.validateFunction,
    this.obscureText = false,
    this.maxLines = 1,
    this.star = '*',
     this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        // vertical: AppMargin.m10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              AppText(text: lavelName,fontWeight: FontWeight.bold,fontSize: fontSizeLevel,),
              SizedBox(
                width:3,
              ),

              AppText(text: star,color: Colors.red,fontWeight: FontWeight.bold,),
            ],
          ),
          // Text.rich(
          //   TextSpan(
          //     children: [
          //       TextSpan(
          //         text: lavelName,
          //         style: getSemiBoldStyle(
          //             color: CustomColor.darkGrey, fontSize: AppSize.s16),
          //       ),
          //       TextSpan(
          //         text: star,
          //         style: getSemiBoldStyle(
          //             color: Colors.red, fontSize: AppSize.s16),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: AppSize.s4,
          // ),
          Container(
            height: 50,
            color: color,
            child: TextFormField(
              controller: controller,
              keyboardType: textInputType,
              textInputAction: textInputAction,
              maxLines: maxLines,
              style: getSemiBoldStyle(
                  color: Colors.black, fontSize: 16),
              textAlign: TextAlign.start,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.only(topRight: Radius.circular(tr!), topLeft: Radius.circular(tl!), bottomRight: Radius.circular(br!), bottomLeft: Radius.circular(bl!)),
                ),
                hintText: histsName,
                suffixIcon: InkWell(
                  onTap: press,
                  child: Icon(
                    iconData,
                    color: CustomColor.darkGrey,
                  ),
                ),
              ),
              validator: (value) => validateFunction(value),
            ),
          )
        ],
      ),
    );
  }
}
