import 'package:dokan_pos/app/constraints/custom_color.dart';
import 'package:flutter/material.dart';

showLoaderDialog( context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          color: CustomColor.darkPrimary,
        ),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text(
              "Please wait...",
              style: TextStyle(
                  color: CustomColor.textColor, fontWeight: FontWeight.w600),
            )),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
