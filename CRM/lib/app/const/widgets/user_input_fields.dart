import 'package:flutter/material.dart';

import '../color_constant.dart';
import '../string_manager.dart';
import '../text_style_constant.dart';
import '../values_manager.dart';

class UserInputFields extends StatelessWidget {
  final TextEditingController? controller;
  final String lavelName, histsName;
  final IconData iconData;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function validateFunction;
  final bool obscureText;
  final int maxLines;
  final String star;
  final VoidCallback press;

  const UserInputFields({
    Key? key,
     this.controller,
    required this.lavelName,
    required this.histsName,
    required this.iconData,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    required this.validateFunction,
    this.obscureText = false,
    this.maxLines = AppIntValue.i1,
    this.star = AppStrings.star,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppMargin.m10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: lavelName,
                  style: getSemiBoldStyle(
                      color: CustomColor.darkGrey, fontSize: AppSize.s16),
                ),
                TextSpan(
                  text: star,
                  style: getSemiBoldStyle(
                      color: Colors.red, fontSize: AppSize.s16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          TextFormField(
            controller: controller,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            maxLines: maxLines,
            style: getSemiBoldStyle(
                color: CustomColor.black, fontSize: 16),
            textAlign: TextAlign.start,
            obscureText: obscureText,
            decoration: InputDecoration(
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
          )
        ],
      ),
    );
  }
}
