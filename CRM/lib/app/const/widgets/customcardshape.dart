import 'package:flutter/material.dart';

import '../color_constant.dart';

class CustomCardShape extends StatelessWidget {
  final String? text;
  const CustomCardShape({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        //alignment: Alignment.center,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: CustomColor.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text.toString(),
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
