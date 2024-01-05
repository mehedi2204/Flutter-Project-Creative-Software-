import 'package:flutter/material.dart';

import '../color_constant.dart';

showLoaderDialog( context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          color: CustomColor.primary,
        ),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text(
              "Please wait...",
              style: TextStyle(
                  color: CustomColor.dPrimary, fontWeight: FontWeight.w600),
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
