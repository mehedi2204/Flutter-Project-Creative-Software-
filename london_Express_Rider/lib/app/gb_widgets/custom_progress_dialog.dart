import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:flutter/material.dart';

showLoaderDialog( context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          color: AppColorsConst.dPrimaryColor,
        ),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text(
              "Please wait...",
              style: TextStyle(
                  color: AppColorsConst.orrange, fontWeight: FontWeight.w600),
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
