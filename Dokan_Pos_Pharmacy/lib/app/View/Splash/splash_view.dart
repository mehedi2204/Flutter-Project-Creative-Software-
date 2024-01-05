import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constraints/storage_healper.dart';
import '../../constraints/styling.dart';
import '../../routes/app_pages.dart';
import '../Home/HomeView.dart';

class SplashView extends StatefulWidget {

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            onPageChanged: (index){
              setState(() {
                onLastPage = (index ==2);
              });
            },
            controller: _controller,
            children: [
              Container(
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 150,
                      backgroundImage: AssetImage(
                        "assets/qrcode.gif",
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Quick Checkout',
                      style: getBoldStyle(color: Colors.black, fontSize: 20),
                    ),
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Text(
                        'Have a lot of products to sell? Utilize the barcode scanner and reduce your checkout time drastically!',
                        style:
                            getSemiBoldStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Easy Sharing',
                      style: getBoldStyle(color: Colors.black, fontSize: 20),
                    ),
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Text(
                        'Multiple convenient ways for you to share the transaction receipt with your customers.',
                        style:
                        getSemiBoldStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 120,
                      backgroundImage: AssetImage(
                        "assets/graph.gif",
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Track Your Profit',
                      style: getBoldStyle(color: Colors.black, fontSize: 20),
                    ),
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Text(
                        'Revenue and expenses records help you to make yoir pivotal business decision better.',
                        style:
                        getSemiBoldStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            child: Column(
              children: [
                SmoothPageIndicator(controller: _controller, count: 3),
                SizedBox(
                  height: 10,
                ),
                onLastPage ?
                TextButton(
                    onPressed: () {
                      print(StorageHelper.readString(key: "token"));
                      StorageHelper.readString(key: "token") == null?
                      Get.offAllNamed(Routes.LOGIN):
                      Get.offAllNamed(Routes.HOME);

                    },
                    child: Text(
                      'Get Started',
                      style:
                          getSemiBoldStyle(color: Colors.white, fontSize: 17),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(250, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))) : TextButton(
                    onPressed: () {
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: Text(
                      'Next',
                      style:
                      getSemiBoldStyle(color: Colors.white, fontSize: 17),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(250, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
