import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constraints/styling.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.left,
      required this.right,
      required this.press})
      : super(key: key);

  final image;
  final String title;
  final double left;
  final double right;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: press,
        child: Container(
          //padding: const EdgeInsets.all(10),
          height: 150,
          margin: EdgeInsets.only(
            right: right,
            left: left,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
               //border: Border.all(width: 1, color: Colors.black),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ]),
          child: Stack(
            children: [
              image,
              Positioned.fill(
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    title,
                    style: getBoldStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
