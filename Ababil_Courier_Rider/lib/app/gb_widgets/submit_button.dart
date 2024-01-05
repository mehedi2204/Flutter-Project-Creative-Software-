import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:flutter/material.dart';



class SubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const SubmitButton({Key? key, required this.title, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // colors: [Color(0xfffbb448), Color(0xfff7892b)],
              colors: [
                AppColorsConst.oPrimaryColor.withOpacity(0.5),
                AppColorsConst.dPrimaryColor
              ]),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
