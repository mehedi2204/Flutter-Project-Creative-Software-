import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constraints/styling.dart';

class SplashCard extends StatelessWidget {
  const SplashCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage(
                  "assets/posprinter.gif",
                ),
              ),
              SizedBox(height: 40,),
              Text(
                'Quick Checkout',
                style: getBoldStyle(color: Colors.black,fontSize: 20),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Text(
                  'Have a lot of products to sell? Utilize the barcode scanner and reduce your checkout time drastically!',
                  style: getSemiBoldStyle(color: Colors.black,fontSize: 15),
                ),
              ),
            ],
      ),
    );
  }
}
