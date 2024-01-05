import 'package:amvines_rider_new/app/gb_widgets/round_elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyFailureNoInternetView extends StatelessWidget {
  final String title, description, buttonText, image;
  final VoidCallback onPressed;
  bool? ishome;
  EmptyFailureNoInternetView(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.image,
      required this.onPressed,
      this.ishome = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Lottie.asset(
                image,
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ishome! ? Colors.white : Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: TextStyle(
                    fontSize: 14, color: ishome! ? Colors.white : Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              RoundedElevatedButton(
                width: 200,
                onPressed: onPressed,
                childText: buttonText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
