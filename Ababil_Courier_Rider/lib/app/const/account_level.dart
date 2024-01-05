import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:flutter/material.dart';

class AccountLevel extends StatelessWidget {
  final lblText1, lblText2;
  final VoidCallback press;
  const AccountLevel(
      {Key? key,
      required this.lblText1,
      required this.lblText2,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            //'Already have an account ?',
            lblText1,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: press,
            child: Text(
              lblText2,
              style: TextStyle(
                  color: AppColorsConst.oPrimaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
